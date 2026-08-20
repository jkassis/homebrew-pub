class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.13/jarhc-darwin-arm64-0.1.13.tar.gz"
      sha256 "8cefe68506df8848b0732ad1a5245d74b09f31b430b6cb6e6dc38a206d04f677"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.13/jarhc-darwin-amd64-0.1.13.tar.gz"
      sha256 "3b964c2593a7468045824cde11701d669ef994b992a3a9c51473429584abfe05"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.13", shell_output("#{bin}/jarhc --version")
  end
end
