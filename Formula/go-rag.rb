# go-rag Homebrew formula TEMPLATE (rendered by release.yml's `tap` job).
# Placeholders 0.3.0, cd63f8b0b9d6775ea36bb941359fb7124756a01aff00bc34a74ed5bdf57544b7, 9a72f5e0a7ced674615bd9b32d7bbb80e8ecc353370889ce344795015184a081, 487b81449c704812dd273db2b13e22c5ba66d75d7791264127c977f13a973888,
# fd23869990b9d02b04aee0b2f22f291786f7a6bceb1199310495f08449385c3d are substituted per release. Do not edit the tap repo's copy
# by hand — it is regenerated on each tag.
class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "9a72f5e0a7ced674615bd9b32d7bbb80e8ecc353370889ce344795015184a081"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "cd63f8b0b9d6775ea36bb941359fb7124756a01aff00bc34a74ed5bdf57544b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "fd23869990b9d02b04aee0b2f22f291786f7a6bceb1199310495f08449385c3d"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "487b81449c704812dd273db2b13e22c5ba66d75d7791264127c977f13a973888"
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
