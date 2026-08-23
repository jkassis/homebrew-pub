class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  version "0.1.2"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-v0.1.2/jarhc-darwin-arm64-0.1.2.tar.gz"
      sha256 "257107964becc656b7ba114af35a4d32e1251894e41e4794ac1f7511a1d4533d"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-v0.1.2/jarhc-darwin-amd64-0.1.2.tar.gz"
      sha256 "7470ebbc07d7b7fe9f5278f863134e4ad82dbba81309232318cb0353e8e057ac"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.2", shell_output("#{bin}/jarhc --version")
  end
end
