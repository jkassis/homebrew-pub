class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.6/weave-darwin-arm64-0.1.6.tar.gz"
      sha256 "18e81ae1bf7e329362f84a1ae5d16c53a76f8bcebf331d931c7c8931321b6ac5"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.6/weave-darwin-amd64-0.1.6.tar.gz"
      sha256 "f332170fd0f6056a0c04d800cfb24f5d00a35bc9c07ea17b299c46d3f890747d"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
