# typed: false
# frozen_string_literal: true

class LldapCli < Formula
  desc "Command-line interface for LLDAP server management"
  homepage "https://github.com/madeinoz67/lldap-cli"
  version "1.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-darwin-arm64"
      sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64"

      def install
        bin.install "lldap-cli-darwin-arm64" => "lldap-cli"
      end
    end

    on_intel do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-darwin-x64"
      sha256 "PLACEHOLDER_SHA256_DARWIN_X64"

      def install
        bin.install "lldap-cli-darwin-x64" => "lldap-cli"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-linux-arm64"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"

      def install
        bin.install "lldap-cli-linux-arm64" => "lldap-cli"
      end
    end

    on_intel do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-linux-x64"
      sha256 "PLACEHOLDER_SHA256_LINUX_X64"

      def install
        bin.install "lldap-cli-linux-x64" => "lldap-cli"
      end
    end
  end

  test do
    assert_match "lldap-cli", shell_output("#{bin}/lldap-cli --version")
  end
end
