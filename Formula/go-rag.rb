# go-rag Homebrew formula TEMPLATE (rendered by release.yml's `tap` job).
# Placeholders 0.2.1, 15537afc875cfb5dc0bdd107beba1dec9b06f20f7739a79b55d274862492c33e, 48f454bbc19149a8abe50736a32d6c3a5057cd6190d6684a93a2f577463a44be, bf40bd8956f8d577091cf400f861346b6f44f470c1303c13ddc2cf867206e13e,
# 43d02369f7f16373006a2a941ce3d36abbcfb9d28cf15a80299f2d0c11646df8 are substituted per release. Do not edit the tap repo's copy
# by hand — it is regenerated on each tag.
class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "48f454bbc19149a8abe50736a32d6c3a5057cd6190d6684a93a2f577463a44be"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "15537afc875cfb5dc0bdd107beba1dec9b06f20f7739a79b55d274862492c33e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "43d02369f7f16373006a2a941ce3d36abbcfb9d28cf15a80299f2d0c11646df8"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "bf40bd8956f8d577091cf400f861346b6f44f470c1303c13ddc2cf867206e13e"
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
