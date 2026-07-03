# go-rag Homebrew formula TEMPLATE (rendered by release.yml's `tap` job).
# Placeholders 0.3.2, 544471548d31dab4385bd1367b0a412d1dc399be1e8992f41537db927b8ce10e, 89dc1a4b8a92212b531201878621736f7b4dfeef686d8f5a74017fa63ee33b42, d5c58daf077a37347f69e3d8bfd73f5a18b32648d988c3b8bb522d84fc7d8166,
# 89f7b0d5c4b6a18879324c3cbf1a9dd69c32f0a6b0663b761e6989e2f031f3f8 are substituted per release. Do not edit the tap repo's copy
# by hand — it is regenerated on each tag.
class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "89dc1a4b8a92212b531201878621736f7b4dfeef686d8f5a74017fa63ee33b42"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "544471548d31dab4385bd1367b0a412d1dc399be1e8992f41537db927b8ce10e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "89f7b0d5c4b6a18879324c3cbf1a9dd69c32f0a6b0663b761e6989e2f031f3f8"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "d5c58daf077a37347f69e3d8bfd73f5a18b32648d988c3b8bb522d84fc7d8166"
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
