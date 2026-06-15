class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.20/weave-darwin-arm64-0.1.20.tar.gz"
      sha256 "535cec9e63f80bd301e777a94d14cf73d27113d67c905d309818f66c44d7af05"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.20/weave-darwin-amd64-0.1.20.tar.gz"
      sha256 "8294709b388bb4988185461b0adbeddf2e57ac1f49114093fab7dc078debcd09"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
