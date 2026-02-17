# frozen_string_literal: true

class VoiceServer < Formula
  desc "Local-first TTS voice server using MLX-audio with Kokoro-82M model"
  homepage "https://github.com/madeinoz67/voice-server"
  version "0.1.11"
  license "MIT"

  depends_on "oven-sh/bun/bun"
  depends_on "ffmpeg"

  # Install from git head
  head "https://github.com/madeinoz67/madeinoz-voice-server.git", branch: "main"

  def install
    # Install source files to share/voice-server directory
    (share/"voice-server").install Dir["*"]

    # Create wrapper script
    (bin/"voice-server").write <<~EOS
      #!/bin/bash
      # Wrapper script for voice-server

      SERVER_DIR="#{share}/voice-server"
      BUN="#{Formula["oven-sh/bun/bun"].opt_bin}/bun"
      export PORT="${PORT:-8888}"
      export PATH="#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:$PATH"

      cd "$SERVER_DIR" || exit 1

      # Install dependencies if needed
      if [ ! -d "node_modules" ]; then
        echo "Installing dependencies..."
        "$BUN" install
      fi

      # Run the server
      exec "$BUN" run src/ts/server.ts "$@"
    EOS

    # Make wrapper executable
    chmod 0755, bin/"voice-server"

    # Create launchd plist for brew services
    (prefix/"homebrew.mxcl.voice-server.plist").write <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>homebrew.mxcl.voice-server</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{bin}/voice-server</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>StandardOutPath</key>
        <string>#{var}/log/voice-server.log</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/voice-server.log</string>
        <key>EnvironmentVariables</key>
        <dict>
          <key>PORT</key>
          <string>8888</string>
          <key>PATH</key>
          <string>/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
        </dict>
      </dict>
      </plist>
      EOS
  end

  def post_install
    # Install dependencies after installation
    system "bun", "install", chdir: share/"voice-server"

    # Check for MLX-audio backend
    mlx_check = `which mlx-audio 2>/dev/null`.strip
    if mlx_check.empty?
      ohai "MLX-audio backend not found. To install:"
      ohai "  uv tool install mlx-audio"
      ohai "Or pipx install mlx-audio"
    end
  end

  test do
    # Test that the wrapper script exists and is executable
    assert_predicate bin/"voice-server", :exist?
    assert_predicate bin/"voice-server", :executable?

    # Test that the source directory was installed
    assert_predicate share/"voice-server/src/ts/server.ts", :exist?
  end

  service do
    run [bin/"voice-server"]
    keep_alive true
    log_path var/"log/voice-server.log"
    error_log_path var/"log/voice-server.log"
    environment_variables PORT: "8888"
  end
end
