# go-rag Homebrew formula TEMPLATE (rendered by release.yml's `tap` job).
# Placeholders 0.2.2, a403db09a58e5788f421f8b4224c281bce8a0c389cbf54eacf4c60eda02eb88d, a479dd4adf61f8df4c1b4cbc9caa2ee13b7bc4979400c62999fc44b5bf8ae9ba, 79ac663fb6ec2ed22a56f60be6a3aec1c00fe53e912493171879532fc7136eb3,
# 40b6e29c8896fedcdc2709e0ecb23145b268edd2b57db391fe47fbd6ee249bdf are substituted per release. Do not edit the tap repo's copy
# by hand — it is regenerated on each tag.
class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "a479dd4adf61f8df4c1b4cbc9caa2ee13b7bc4979400c62999fc44b5bf8ae9ba"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "a403db09a58e5788f421f8b4224c281bce8a0c389cbf54eacf4c60eda02eb88d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "40b6e29c8896fedcdc2709e0ecb23145b268edd2b57db391fe47fbd6ee249bdf"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "79ac663fb6ec2ed22a56f60be6a3aec1c00fe53e912493171879532fc7136eb3"
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
