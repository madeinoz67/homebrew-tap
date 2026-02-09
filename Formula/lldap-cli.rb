class LldapCli < Formula
  desc "Command-line interface for LLDAP server management"
  homepage "https://github.com/madeinoz67/lldap-cli"
  version "1.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-darwin-arm64.tar.gz"
      sha256 "a301a9606e8758ae33e16d82687fe83e34dbda55fd912ee835f85047e5899765"

      def install
        bin.install "lldap-cli-darwin-arm64" => "lldap-cli"
      end
    end
    on_intel do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-darwin-x64.tar.gz"
      sha256 "f7a349357780aa1c412634fc5ef8942f20aadc7ae78102e8368373385736c235"

      def install
        bin.install "lldap-cli-darwin-x64" => "lldap-cli"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-linux-arm64.tar.gz"
      sha256 "6172146fac017540a045db885c9b5068491a6538850fdd7beb1e2535fcf1d81c"

      def install
        bin.install "lldap-cli-linux-arm64" => "lldap-cli"
      end
    end
    on_intel do
      url "https://github.com/madeinoz67/lldap-cli/releases/download/v#{version}/lldap-cli-linux-x64.tar.gz"
      sha256 "8d8e839f771809cccea84f19ac9139d2d58c642a711930ea19c561321ce214d1"

      def install
        bin.install "lldap-cli-linux-x64" => "lldap-cli"
      end
    end
  end

  test do
    assert_match "lldap-cli", shell_output("#{bin}/lldap-cli --version")
  end
end
