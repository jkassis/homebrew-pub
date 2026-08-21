class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.20/jarhc-darwin-arm64-0.1.20.tar.gz"
      sha256 "c5407aa7c3a68d5d5d92c288540fef1946b0979733bce2cf071c19c38f864196"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.20/jarhc-darwin-amd64-0.1.20.tar.gz"
      sha256 "9925967874b49fb96ea112679e3894037099b0a671b421fe5ea4d834ebd13d27"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.20", shell_output("#{bin}/jarhc --version")
  end
end
