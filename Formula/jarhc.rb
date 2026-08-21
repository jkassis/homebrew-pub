class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.19/jarhc-darwin-arm64-0.1.19.tar.gz"
      sha256 "68a04f3459cfa76f74fd62bb7a3d91f8c5424115ace1f23953c2e01b2908e8b9"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.19/jarhc-darwin-amd64-0.1.19.tar.gz"
      sha256 "2afa5babf61575f8a3ad3afaf2f9b49f745198b04f940dfc7670bfb0780f7b7a"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.19", shell_output("#{bin}/jarhc --version")
  end
end
