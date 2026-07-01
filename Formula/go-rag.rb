# go-rag Homebrew formula TEMPLATE (rendered by release.yml's `tap` job).
# Placeholders 0.2.0, adc15a8240f7d25dd8afddd276656a9387b76f049304cba03c984cdbaf0b7d65, 7d2458a163583d62f79b27c4c8f61a08787ce761b63237d44f4550b3cf299994, d354e2e1d55f9ab68e864e25cab38e9d8679b14ff34c8d19ba1911222e3fb885,
# 11ab0277905fcd6e949c5b0384f9390331d7044124e33fc6f0275c06b1b9f917 are substituted per release. Do not edit the tap repo's copy
# by hand — it is regenerated on each tag.
class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "7d2458a163583d62f79b27c4c8f61a08787ce761b63237d44f4550b3cf299994"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "adc15a8240f7d25dd8afddd276656a9387b76f049304cba03c984cdbaf0b7d65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "11ab0277905fcd6e949c5b0384f9390331d7044124e33fc6f0275c06b1b9f917"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "d354e2e1d55f9ab68e864e25cab38e9d8679b14ff34c8d19ba1911222e3fb885"
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
