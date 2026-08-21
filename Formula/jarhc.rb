class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.16/jarhc-darwin-arm64-0.1.16.tar.gz"
      sha256 "347065f8b2ecd75a3aaa4b41561f4a6698df23326eb888edd33bd57709e846d2"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.16/jarhc-darwin-amd64-0.1.16.tar.gz"
      sha256 "c71323c7fcfcfb1d8dd768e6572976d29339fcfab3074c48b293bb75c12c8557"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.16", shell_output("#{bin}/jarhc --version")
  end
end
