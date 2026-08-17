class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.5/jarhc-darwin-arm64-0.1.5.tar.gz"
      sha256 "16b50bf6e1643ed3f8a74cf714999f7897cc6dcc847ccc047b8ed7b01897e0fc"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.5/jarhc-darwin-amd64-0.1.5.tar.gz"
      sha256 "fe9252cc61b86f7c93dfc524b4b74ed08e94c0c022646e3d6e9c063baf4bb5b0"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.5", shell_output("#{bin}/jarhc --version")
  end
end
