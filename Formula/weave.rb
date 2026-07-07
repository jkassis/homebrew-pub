class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.32/weave-darwin-arm64-0.1.32.tar.gz"
      sha256 "7b201e1476cce8041cf8bbdaaa02abb324f333e1628e1ee96c7fd5b8f3fff5d1"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.32/weave-darwin-amd64-0.1.32.tar.gz"
      sha256 "1be0e2d25105a55d6e33f492b342e15fdfb10bb12c9bd6ab6d558d47fcefabd7"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "weave 0.1.32", shell_output("#{bin}/weave --version")
  end
end
