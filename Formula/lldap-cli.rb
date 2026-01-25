# typed: true
# frozen_string_literal: true

class LldapCli < Formula
  desc "Command-line interface for LLDAP server management"
  homepage "https://github.com/madeinoz67/lldap-cli"
  version "1.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-darwin-arm64"
      sha256 "475c74d4e7030bb6e8ad455e1eea1ea4d88a2e303b0256502f56af720784bcd0"

      def install
        bin.install "lldap-cli-darwin-arm64" => "lldap-cli"
      end
    end

    on_intel do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-darwin-x64"
      sha256 "d094b22bb028ecce1eef5c19a158ed99442065dd4f9abbfd0d25f5e394b0b0fc"

      def install
        bin.install "lldap-cli-darwin-x64" => "lldap-cli"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-linux-arm64"
      sha256 "65cebac8e30a08007898162066ed25fb7a91e958a8404db468ab338b231d3d82"

      def install
        bin.install "lldap-cli-linux-arm64" => "lldap-cli"
      end
    end

    on_intel do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-linux-x64"
      sha256 "ea5d38be60499039116f62eec8590f7af908db989904c1910516c82bb3ba60e9"

      def install
        bin.install "lldap-cli-linux-x64" => "lldap-cli"
      end
    end
  end

  test do
    assert_match "lldap-cli", shell_output("#{bin}/lldap-cli --version")
  end
end
