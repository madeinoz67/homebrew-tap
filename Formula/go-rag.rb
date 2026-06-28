# go-rag Homebrew formula — prebuilt static binaries from the GitHub release
# (pure-Go, CGO_ENABLED=0). Four platforms: macOS/Linux x arm64/amd64.
# Install: brew install madeinoz67/tap/go-rag
# The tap-bump job in go-rag's release.yml regenerates this file per release.
class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "5486f6c07b6dda5be236b84349f4d701d49a0eae673ee873b82a92c26b100f97"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "3fe9144fcc0aa5c35fa2b433f94e6891aacd5bf099ee483a0bdbd1c57c84030b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "5c9eaa368f600c8df1d0d0037d0386c4b983d12ab0eb9f6a1813e4a31ec03b79"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "73b798bc042d92d7268033bbc81588b83e85d1b54e28eba8ff2aa8dc35ab630b"
    end
  end

  # The archive contains a single static binary at its root.
  def install
    bin.install "go-rag"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/go-rag --version")
  end
end
