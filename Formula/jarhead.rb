class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.59/jarhead-darwin-arm64-0.1.59.tar.gz"
    sha256 "a92c0e1a81a6f56a10467d188d8e7d7ab2594823e1da2af605baaed797ede48a"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.59/jarhead-darwin-amd64-0.1.59.tar.gz"
    sha256 "32f0d31ee0c9ee443ac1c549edb1db3a73e12bec3b001f4b4fbd79b04d4432d5"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.59", shell_output("#{bin}/jarhead --version")
  end
end
