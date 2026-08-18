class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.10/jarhc-darwin-arm64-0.1.10.tar.gz"
      sha256 "ea6b139f4d9bcecfb3c3dba798ccd0d4dc45b8b29da17843084220cd9e261aa8"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.10/jarhc-darwin-amd64-0.1.10.tar.gz"
      sha256 "c9181cbf56602cb3c2632e91413837e450996d169f5159853aa44974e2cfed2c"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.10", shell_output("#{bin}/jarhc --version")
  end
end
