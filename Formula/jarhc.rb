class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  version "0.1.3"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.3/jarhc-darwin-arm64-0.1.3.tar.gz"
      sha256 "fd88be0701f53ebed629dbf68b9b263c81afc7acaed7f0c31314ac4ee567e536"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.3/jarhc-darwin-amd64-0.1.3.tar.gz"
      sha256 "11376cd68d018e9da6ecb7f9b01a03c381a77bba8971a62ba506c19f4932291d"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.3", shell_output("#{bin}/jarhc --version")
  end
end
