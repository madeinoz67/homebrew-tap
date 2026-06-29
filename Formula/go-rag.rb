# go-rag Homebrew formula TEMPLATE (rendered by release.yml's `tap` job).
# Placeholders 0.1.4, 80eec419c7b4c715a926c6af33c9382b7204d372b3e6dba4633b65c710a70601, b5e0a3165c5f0a641ac570b525eb0ccf1048f21b5faa40687fdcf21188cc7886, 127e6ff80ccf7877299c47cfeafbedc96a7cfdc4c2d0f4f379a72b287d81fcc0,
# 66aa6242c38e8699db44851c6c9f821ed9b8adf56531c18a2d54acf512a73d62 are substituted per release. Do not edit the tap repo's copy
# by hand — it is regenerated on each tag.
class GoRag < Formula
  desc "Single-binary local RAG database with bundled pure-Go embeddings (no Ollama required)"
  homepage "https://github.com/madeinoz67/go-rag"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-arm64.tar.gz"
      sha256 "b5e0a3165c5f0a641ac570b525eb0ccf1048f21b5faa40687fdcf21188cc7886"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-darwin-amd64.tar.gz"
      sha256 "80eec419c7b4c715a926c6af33c9382b7204d372b3e6dba4633b65c710a70601"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-arm64.tar.gz"
      sha256 "66aa6242c38e8699db44851c6c9f821ed9b8adf56531c18a2d54acf512a73d62"
    end
    on_intel do
      url "https://github.com/madeinoz67/go-rag/releases/download/v#{version}/go-rag-v#{version}-linux-amd64.tar.gz"
      sha256 "127e6ff80ccf7877299c47cfeafbedc96a7cfdc4c2d0f4f379a72b287d81fcc0"
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
