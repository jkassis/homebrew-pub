class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.6/jarhc-darwin-arm64-0.1.6.tar.gz"
      sha256 "e5653a3acdc61b54dc4ddcf09ee71a9f322965cb6030f1f405bebc548264b5b3"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.6/jarhc-darwin-amd64-0.1.6.tar.gz"
      sha256 "afb030ba5b499885fffd9ce5e07a33b83ac6d759b6e7576d7bed233218493338"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.6", shell_output("#{bin}/jarhc --version")
  end
end
