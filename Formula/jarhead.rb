class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.26/jarhead-darwin-arm64-0.1.26.tar.gz"
      sha256 "cabe8f08846f1dd1f1c5ab7840757c0981fd7d70b509011726e27bf7a224a96f"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.26/jarhead-darwin-amd64-0.1.26.tar.gz"
      sha256 "64e9e1871f7a960dc0818018bee57e5d89beac1e38e679c1c37369435f0d3066"
    end
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.26", shell_output("#{bin}/jarhead --version")
  end
end
