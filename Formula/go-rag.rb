# go-rag Homebrew formula TEMPLATE (rendered by release.yml's `tap` job).
# Placeholders 0.3.1, d0ceadc513dbad2a6248e086fd6a188c35b7ac8da0a9ae66cf5c195403379f66, fb4fca8911ef9781c9d71ebc3f82bb2b4f885b0bd41ce64b4fb8823a73885a04, c3b4093e6220e0eb0f18715c2524d183e72436056ff605c5ead8efa8640bf5a1,
# fa3ed3bb21d0bf1aede16ac4e482fef91bb4e1e38760f4d18c69ec94908880f8 are substituted per release. Do not edit the tap repo's copy
# by hand — it is regenerated on each tag.
class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "fb4fca8911ef9781c9d71ebc3f82bb2b4f885b0bd41ce64b4fb8823a73885a04"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "d0ceadc513dbad2a6248e086fd6a188c35b7ac8da0a9ae66cf5c195403379f66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "fa3ed3bb21d0bf1aede16ac4e482fef91bb4e1e38760f4d18c69ec94908880f8"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "c3b4093e6220e0eb0f18715c2524d183e72436056ff605c5ead8efa8640bf5a1"
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
