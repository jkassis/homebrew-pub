class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.113/jarhead-darwin-arm64-0.1.113.tar.gz"
    sha256 "ab604b1e48db63e9fbbe11c6aff8c8b31535c2d1aa4c6cd8adf0105aa457a1e4"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.113/jarhead-darwin-amd64-0.1.113.tar.gz"
    sha256 "aec6cf11f968807a2f51a6507a2bc4f74d680e9903b90eea0da58dc08f5b480b"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.113", shell_output("#{bin}/jarhead --version")
  end
end
