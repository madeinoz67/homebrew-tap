class LldapCli < Formula
  desc "Command-line interface for LLDAP server management"
  homepage "https://github.com/madeinoz67/lldap-cli"
  version "1.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-darwin-arm64.tar.gz"
      sha256 "d72e06aef1f12b4a9ae3feff235625351d8d3651ed3f2112aef9870830514eee"

      def install
        bin.install "lldap-cli-darwin-arm64" => "lldap-cli"
      end
    end
    on_intel do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-darwin-x64.tar.gz"
      sha256 "b4a9eca0cb52e3823aea4d06132d8f1911061fd8d9a43e68a6561667b08e7e5c"

      def install
        bin.install "lldap-cli-darwin-x64" => "lldap-cli"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-linux-arm64.tar.gz"
      sha256 "b29c17c3ba08ef2f82de6f5ce4ba93259fb2ccdab754fa3184373a04cfd58b45"

      def install
        bin.install "lldap-cli-linux-arm64" => "lldap-cli"
      end
    end
    on_intel do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-linux-x64.tar.gz"
      sha256 "f550ef21689b4fdd6e9a5b42857a32f3f9578aaa8ab3049c20e96ed45356f7ba"

      def install
        bin.install "lldap-cli-linux-x64" => "lldap-cli"
      end
    end
  end

  test do
    assert_match "lldap-cli", shell_output("#{bin}/lldap-cli --version")
  end
end
