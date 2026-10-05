class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.108/jarhead-darwin-arm64-0.1.108.tar.gz"
    sha256 "1dd6fea681b900c76010f843e242554de388e1a4efca4c0c1df37a7599b1f6a8"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.108/jarhead-darwin-amd64-0.1.108.tar.gz"
    sha256 "bd1a3b243920877c83fdd1467d85dabc7158ccd8602ca6a7e955029bae3a65a8"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.108", shell_output("#{bin}/jarhead --version")
  end
end
