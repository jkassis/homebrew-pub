class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.118/jarhead-darwin-arm64-0.1.118.tar.gz"
    sha256 "61e1b52cbcb26159a51d4a1cdd15fb166573d44329dfefb9ffb75d7f6fb0e9f0"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.118/jarhead-darwin-amd64-0.1.118.tar.gz"
    sha256 "0a754eeff0b75c1f1e63c8cf38ff47652b9a00ef8668213ead3e630bb0bdc79e"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.118", shell_output("#{bin}/jarhead --version")
  end
end
