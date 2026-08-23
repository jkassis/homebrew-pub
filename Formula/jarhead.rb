class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.21/jarhead-darwin-arm64-0.1.21.tar.gz"
      sha256 "c106ee93d5ac28d4115afe4c34032da6e89ec643788cdeace999770058f78116"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.21/jarhead-darwin-amd64-0.1.21.tar.gz"
      sha256 "73d5213f14ef4ed9101d2e0869cea5d678d935e89463b62a3e8772af0c6a9e5d"
    end
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.21", shell_output("#{bin}/jarhead --version")
  end
end
