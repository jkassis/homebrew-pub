class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.24/jarhead-darwin-arm64-0.1.24.tar.gz"
      sha256 "e1cf616ff736906f8e522377a0d1dbbad57fb8b7c403741099ec983955a3ecf4"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.24/jarhead-darwin-amd64-0.1.24.tar.gz"
      sha256 "db9c8071c09f6055ad300a71e4108fb8ef2a33b08c311a077dffcad288c54b1d"
    end
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.24", shell_output("#{bin}/jarhead --version")
  end
end
