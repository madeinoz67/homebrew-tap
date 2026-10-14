# frozen_string_literal: true
# Rendered by .github/workflows/publish.yml (tap job) into
# madeinoz67/homebrew-tap Formula/benchweave-sdk.rb: the url and sha256
# lines are filled from the PyPI JSON API for the released version.
class BenchweaveSdk < Formula
  desc "Offline authoring and conformance tools for BenchWeave OTDP device plugins"
  homepage "https://github.com/madeinoz67/benchweave-sdk"
  url "https://files.pythonhosted.org/packages/0c/db/c6b796df5065fcb4a68191cff929632625be780351bd43276bce812cdc52/benchweave_sdk-0.12.0.tar.gz"
  sha256 "2a0071995bfc01c4424f1a7832cc850d2fae3a75af1ef2372934559365fcc99c"
  license "MIT"

  livecheck do
    url "https://pypi.org/pypi/benchweave-sdk/json"
    regex(/"version":\s*"?(\d+(?:\.\d+)+)"?/i)
  end
  depends_on "python@3.13"

  def install
    # Plain stdlib venv + one pip install of the staged sdist: runtime deps
    # resolve live from PyPI (Homebrew's virtualenv_install_with_resources
    # installs --no-deps, which would need every transitive dep pinned as a
    # resource block).
    venv = libexec/"venv"
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "venv", venv
    system venv/"bin/pip", "install", "--no-cache-dir", buildpath
    bin.install_symlink venv/"bin/benchweave-sdk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/benchweave-sdk --version")
  end
end
