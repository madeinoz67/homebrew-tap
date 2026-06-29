# go-rag Homebrew formula TEMPLATE (rendered by release.yml's `tap` job).
# Placeholders 0.1.3, 8e022f242e31d0cc0be6ce6067777e187c59465dcb92e27f9335cdfd18db2e38, 2a6d8121a045c2ce9324a20dd0c1999908bef8ce1d808793d2e9c092109c18fe, fa18ae597948916d26e5aba7092edbdd73705ea36bd049ba0461cdab4b455f93,
# 2a568cd5994244e1fa0dfb5d1debbd681c2e21fda63e4217cd01bcfb9f717dd4 are substituted per release. Do not edit the tap repo's copy
# by hand — it is regenerated on each tag.
class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "2a6d8121a045c2ce9324a20dd0c1999908bef8ce1d808793d2e9c092109c18fe"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "8e022f242e31d0cc0be6ce6067777e187c59465dcb92e27f9335cdfd18db2e38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "2a568cd5994244e1fa0dfb5d1debbd681c2e21fda63e4217cd01bcfb9f717dd4"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "fa18ae597948916d26e5aba7092edbdd73705ea36bd049ba0461cdab4b455f93"
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
