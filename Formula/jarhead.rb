class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub/releases/tag/jarhead-dist-v0.1.115"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.115/jarhead-darwin-arm64-0.1.115.tar.gz"
    sha256 "e89175c22e6f877dd40fa61d3c9ef8234240f8f34dddab125326f2c53d4af7b5"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.115/jarhead-darwin-amd64-0.1.115.tar.gz"
    sha256 "777cba29c21465aa306a5f7eacac84a86bdc133ee907f4c9581347663de689b0"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.115", shell_output("#{bin}/jarhead --version")
  end
end
