class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.7/jarhc-darwin-arm64-0.1.7.tar.gz"
      sha256 "f1d222ce19422c60612a2807ef39d6dd05fa56a05f8bbfb107a5e2aa985a2902"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.7/jarhc-darwin-amd64-0.1.7.tar.gz"
      sha256 "246dbb050ebcd6254c4ad72509fadbe5087e8178171f5972a8016797d04f19ae"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.7", shell_output("#{bin}/jarhc --version")
  end
end
