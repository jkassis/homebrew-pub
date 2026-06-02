class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.11/weave-darwin-arm64-0.1.11.tar.gz"
      sha256 "a4836f2f57ca119502e5d828a68de025009540632175b0fb2ff37c32c92a3e60"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.11/weave-darwin-amd64-0.1.11.tar.gz"
      sha256 "63b925c29d52312089cf515138a2f47ef6de19ef5aeebb0bbe4ae2d87f021cd8"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
