class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.11/jarhc-darwin-arm64-0.1.11.tar.gz"
      sha256 "94054ff622efaf6590b3067cacbcdff671708c1bd2ae67ea3d1a67e001fddb41"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.11/jarhc-darwin-amd64-0.1.11.tar.gz"
      sha256 "8352a9006d2a49d2dbbc5e12c61f9eaf5e47dcf560844c2133a489157f96298a"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.11", shell_output("#{bin}/jarhc --version")
  end
end
