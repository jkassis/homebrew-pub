class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.15/jarhc-darwin-arm64-0.1.15.tar.gz"
      sha256 "b7331003302d05ffdaf18824fb605f4d2c21ced3d9ed75d8451f462bbd1e2513"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.15/jarhc-darwin-amd64-0.1.15.tar.gz"
      sha256 "81b86ce90fc5eb9cf53be033d5feb4fe3d1db8f910f88ea3dfe87c1030a01373"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.15", shell_output("#{bin}/jarhc --version")
  end
end
