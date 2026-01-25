class LldapCli < Formula
  desc "Command-line interface for LLDAP server management"
  homepage "https://github.com/madeinoz67/lldap-cli"
  version "1.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-darwin-arm64.tar.gz"
      sha256 "03514626741cf5e240a42656663af81d3e02159d9724a0d5c132accf397bef1d"

      def install
        bin.install "lldap-cli-darwin-arm64" => "lldap-cli"
      end
    end
    on_intel do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-darwin-x64.tar.gz"
      sha256 "43836976e2923dd8326ceda11a75639b93a4f96e096f9df025e5dde767101bc2"

      def install
        bin.install "lldap-cli-darwin-x64" => "lldap-cli"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-linux-arm64.tar.gz"
      sha256 "528f02d59b60e7f266588bf15502e92311a1d33691f770508036d45d4b388246"

      def install
        bin.install "lldap-cli-linux-arm64" => "lldap-cli"
      end
    end
    on_intel do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-linux-x64.tar.gz"
      sha256 "4ba5eb0378753e522615662676008b2d4e6d4af03268f585a3c30a6179998e96"

      def install
        bin.install "lldap-cli-linux-x64" => "lldap-cli"
      end
    end
  end

  test do
    assert_match "lldap-cli", shell_output("#{bin}/lldap-cli --version")
  end
end
