class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.1.1"
  license "Apache-2.0"
  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "40d9c568918a3701b3837552a725061c17b63f7cf3bad70a589e135f1ebf984b"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "53ec10711f5949fbad6ac2e4d62abc291d30bcf6d90599def013967bf1b3f975"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "bd8a3c778f0ead90886e81f322f5ec109cec9cce6ec85820241de55dff3a756d"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "e35b851103e307f2eed83e9ade1319f8ca3f2b3d0c91a30b80722f0d553b4f4f"
    end
  end
  def install
    bin.install "go-rag"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/go-rag --version")
  end
end
