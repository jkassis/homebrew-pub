class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.18/jarhc-darwin-arm64-0.1.18.tar.gz"
      sha256 "799b6b5c575d7ecb0b2725814dc02c3b55a421d00ed32297da1ff54f574a2fda"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.18/jarhc-darwin-amd64-0.1.18.tar.gz"
      sha256 "4ef5552d94c5c31eee8e8bfe0c3d7033815001d674266a9509b3cc6341321e29"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.18", shell_output("#{bin}/jarhc --version")
  end
end
