class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.58/jarhead-darwin-arm64-0.1.58.tar.gz"
    sha256 "21506a3dc7e841043f0d378fe770fc23c67b1f352b4c755077840125bb89e121"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.58/jarhead-darwin-amd64-0.1.58.tar.gz"
    sha256 "2838dc081ef1b264ea5f9ccbc3a0463099d7c1b67e4360aec6a8cb1557379a89"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.58", shell_output("#{bin}/jarhead --version")
  end
end
