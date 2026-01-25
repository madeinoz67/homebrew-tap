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
      sha256 "66979a88fbde9d2486269a9e9659b5cd94d77c39618650d8072103843401c7cc"

      def install
        bin.install "lldap-cli-darwin-arm64" => "lldap-cli"
      end
    end

    on_intel do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-darwin-x64"
      sha256 "9ce4ad719a3b41ad98792d4c081cefbbe48b0443ff98465e5ef6b36359e7b4da"

      def install
        bin.install "lldap-cli-darwin-x64" => "lldap-cli"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-linux-arm64"
      sha256 "db5810056fd6b26549e0347c189c135db08731e0ff54fa14fc535a55f6a4845e"

      def install
        bin.install "lldap-cli-linux-arm64" => "lldap-cli"
      end
    end

    on_intel do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-linux-x64"
      sha256 "bf8348f184820be44e0e1fc13fd1e715081d844e2ec2cd2d44f7842b8d1eec0f"

      def install
        bin.install "lldap-cli-linux-x64" => "lldap-cli"
      end
    end
  end

  test do
    assert_match "lldap-cli", shell_output("#{bin}/lldap-cli --version")
  end
end
