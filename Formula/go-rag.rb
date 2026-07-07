# go-rag Homebrew formula TEMPLATE (rendered by release.yml's `tap` job).
# Placeholders 0.3.3, 7cf24e25a700d331a25cff95e826b7c0cca5a4b1d008ee8b4a640e228e6113c0, 032d29024fc03550e2c40c859bc68f15bd0e37d76fd16ec2bf3e72d4e3861746, c4524d8f797ad30debe73fbc15e4f95c07739e7e7eb70d1115212da7ee81291c,
# d360149f2b11ae07f06ec6100f3331f5eacf00c95dec5f835f66cf5ecf3b740b are substituted per release. Do not edit the tap repo's copy
# by hand — it is regenerated on each tag.
class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.3.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "032d29024fc03550e2c40c859bc68f15bd0e37d76fd16ec2bf3e72d4e3861746"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "7cf24e25a700d331a25cff95e826b7c0cca5a4b1d008ee8b4a640e228e6113c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "d360149f2b11ae07f06ec6100f3331f5eacf00c95dec5f835f66cf5ecf3b740b"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "c4524d8f797ad30debe73fbc15e4f95c07739e7e7eb70d1115212da7ee81291c"
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
