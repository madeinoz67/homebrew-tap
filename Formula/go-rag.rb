# go-rag Homebrew formula TEMPLATE (rendered by release.yml's `tap` job).
# Placeholders 0.1.5, 5520c2f3c74c9e65ca34c964325742ce8b95121ced7e11dff07b53ae60779209, 6d13fb453d8861c08b9b7c13cec6d068b42b27f4c1d105e6e5791cd65fc67428, 865bfb0d1cf0d782d3b5c56acc3fe95bd779abfe10856ba46e483e87410e6faf,
# 7c009df323592a82945a94d796ad16a0b205eb13138e22d2b1bf396a796d721e are substituted per release. Do not edit the tap repo's copy
# by hand — it is regenerated on each tag.
class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "6d13fb453d8861c08b9b7c13cec6d068b42b27f4c1d105e6e5791cd65fc67428"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "5520c2f3c74c9e65ca34c964325742ce8b95121ced7e11dff07b53ae60779209"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "7c009df323592a82945a94d796ad16a0b205eb13138e22d2b1bf396a796d721e"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "865bfb0d1cf0d782d3b5c56acc3fe95bd779abfe10856ba46e483e87410e6faf"
    end
  end

  # The release archive contains a single static binary at its root.
  def install
    bin.install "go-rag"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/go-rag --version")
  end
end
