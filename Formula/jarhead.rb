class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.33/jarhead-darwin-arm64-0.1.33.tar.gz"
      sha256 "de36976fa7758204238402538cdcf7a5b4e60d13a0bc5caf80efd05f55e5a5c0"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.33/jarhead-darwin-amd64-0.1.33.tar.gz"
      sha256 "803aecd811dd3dac0fa08b6c40a03d92eb4ab4267321e847c64f0152911d1873"
    end
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.33", shell_output("#{bin}/jarhead --version")
  end
end
