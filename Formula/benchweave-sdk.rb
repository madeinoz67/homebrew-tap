# frozen_string_literal: true
# Rendered by .github/workflows/publish.yml (tap job) into
# madeinoz67/homebrew-tap Formula/benchweave-sdk.rb: the url and sha256
# lines are filled from the PyPI JSON API for the released version.
class BenchweaveSdk < Formula
  desc "Offline authoring and conformance tools for BenchWeave OTDP device plugins"
  homepage "https://github.com/madeinoz67/benchweave-sdk"
  url "https://files.pythonhosted.org/packages/c3/d9/0f8d7f8cbad8364482e0851049651becc771f6ac503017950da92bf455bc/benchweave_sdk-0.3.1.tar.gz"
  sha256 "ad5ea85f1e38ad8ef687cdebf5a107b85670e7d092657aafd748e500e199b7d9"
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
