# frozen_string_literal: true

class VoiceServer < Formula
  desc "Local-first TTS voice server using MLX-audio with Kokoro-82M model"
  homepage "https://github.com/madeinoz67/voice-server"
  version "0.1.11"
  license "MIT"

  depends_on "oven-sh/bun/bun"
  depends_on "ffmpeg"

  # MLX-audio is required but installed separately (Python package)
  # Check via preflight before installation
  def preflight
    # Check for mlx_audio.tts.generate in common locations
    mlx_paths = [
      "#{HOMEBREW_PREFIX}/bin/mlx_audio.tts.generate",
      "#{ENV["HOME"]}/.local/bin/mlx_audio.tts.generate",
    ]

    mlx_found = mlx_paths.any? { |path| File.executable?(path) }
    mlx_found ||= system("which mlx_audio.tts.generate > /dev/null 2>&1")

    unless mlx_found
      opoo "MLX-audio CLI not found!"
      opoo ""
      opoo "voice-server requires mlx-audio for TTS functionality."
      opoo "Install it with one of:"
      opoo ""
      opoo "  uv tool install mlx-audio"
      opoo "  pipx install mlx-audio"
      opoo ""
      opoo "Then symlink to Homebrew path:"
      opoo "  ln -sf ~/.local/bin/mlx_audio.tts.generate #{HOMEBREW_PREFIX}/bin/mlx_audio.tts.generate"
      opoo ""
      opoo "Or add ~/.local/bin to your PATH."

      # Don't fail install, but warn prominently
      # Service will fail to start without mlx-audio
    end
  end

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
      # Include common mlx-audio installation paths
      export PATH="$HOME/.local/bin:#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:/usr/local/bin:$PATH"

      cd "$SERVER_DIR" || exit 1

      # Check for mlx-audio before starting
      if ! command -v mlx_audio.tts.generate &> /dev/null; then
        echo "ERROR: mlx-audio CLI not found in PATH"
        echo "Install with: uv tool install mlx-audio"
        echo "Or: pipx install mlx-audio"
        exit 1
      fi

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
    mlx_check = `which mlx_audio.tts.generate 2>/dev/null`.strip
    if mlx_check.empty?
      ohai ""
      ohai "⚠️  MLX-audio CLI not found!"
      ohai ""
      ohai "voice-server requires mlx-audio for TTS. Install it:"
      ohai ""
      ohai "  uv tool install mlx-audio"
      ohai "  # or"
      ohai "  pipx install mlx-audio"
      ohai ""
      ohai "Then add to PATH or symlink:"
      ohai "  ln -sf ~/.local/bin/mlx_audio.tts.generate #{HOMEBREW_PREFIX}/bin/"
      ohai ""
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
