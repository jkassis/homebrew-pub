class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.8/jarhc-darwin-arm64-0.1.8.tar.gz"
      sha256 "2be2097d61e4b584a8e3d064d156f6a80450e45d32dd7b3d312d6c1cbca58744"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.8/jarhc-darwin-amd64-0.1.8.tar.gz"
      sha256 "2283c46fc69c955713569e1e613f52520edd7b8cc6c5d8ca81e44d5fa67aa871"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.8", shell_output("#{bin}/jarhc --version")
  end
end
