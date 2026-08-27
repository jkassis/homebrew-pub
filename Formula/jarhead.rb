class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.30/jarhead-darwin-arm64-0.1.30.tar.gz"
      sha256 "50b65ccf78a97ee86a2c0fe8e391b5e150ac675d9b2268043ec90ba302bb9ccb"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.30/jarhead-darwin-amd64-0.1.30.tar.gz"
      sha256 "c5a2d124b1c5ca78e04267f6ff751e9d5bb1f3976a1bf71b81f26ed66e5364c8"
    end
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.30", shell_output("#{bin}/jarhead --version")
  end
end
