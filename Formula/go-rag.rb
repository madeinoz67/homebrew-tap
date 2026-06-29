# go-rag Homebrew formula TEMPLATE (rendered by release.yml's `tap` job).
# Placeholders 0.1.2, 1d96a2048b1ea11bef7477cad8d0f9ae2db39d6b16c7ccbfecabcfb5f1a719fb, de45880d8e2b1b7d2060dad69d5ddfbcfed07224b08049f51586ae6e6db79c91, 856fc8f57f85db340224b7305c21dbc998cb229160d86874d97a95c40b7c9ac1,
# 109f4f338324714c779e403e64f01097ff9ad3831447789456679a033f592937 are substituted per release. Do not edit the tap repo's copy
# by hand — it is regenerated on each tag.
class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "de45880d8e2b1b7d2060dad69d5ddfbcfed07224b08049f51586ae6e6db79c91"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "1d96a2048b1ea11bef7477cad8d0f9ae2db39d6b16c7ccbfecabcfb5f1a719fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "109f4f338324714c779e403e64f01097ff9ad3831447789456679a033f592937"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "856fc8f57f85db340224b7305c21dbc998cb229160d86874d97a95c40b7c9ac1"
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
