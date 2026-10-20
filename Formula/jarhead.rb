class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.116/jarhead-darwin-arm64-0.1.116.tar.gz"
    sha256 "7d4f1893ab5b2ff952eda0ee1b6d7d60d3436ad501d2173717c25efca054e4c0"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.116/jarhead-darwin-amd64-0.1.116.tar.gz"
    sha256 "4194ccb91971a7fa71963dc2c3a3fa7a31a70c1ecb7ea9ae23816eb111638b51"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.116", shell_output("#{bin}/jarhead --version")
  end
end
