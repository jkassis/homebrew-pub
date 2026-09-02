class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.31/jarhead-darwin-arm64-0.1.31.tar.gz"
      sha256 "f0b55cd7062e3fdcc7e5ef5f8ab4418a982e9d8302cae899c00cb666c5913945"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.31/jarhead-darwin-amd64-0.1.31.tar.gz"
      sha256 "fa6d7f226daba86ce4353c29d45ef2ed01d7291945aecef5f84d3ca9ee678cec"
    end
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.31", shell_output("#{bin}/jarhead --version")
  end
end
