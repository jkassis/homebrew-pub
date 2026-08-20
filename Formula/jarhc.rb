class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.14/jarhc-darwin-arm64-0.1.14.tar.gz"
      sha256 "37230cd9e7873c4143b95d80d3953a1a1fc5621bd277008094640faf49b8a921"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.14/jarhc-darwin-amd64-0.1.14.tar.gz"
      sha256 "24ad79415d6dc501f8b8e3b10da02e892ca41c6d50a27692e6b425dc4c0f1523"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.14", shell_output("#{bin}/jarhc --version")
  end
end
