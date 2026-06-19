class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.27/weave-darwin-arm64-0.1.27.tar.gz"
      sha256 "e93e5a821177affff4eebcde5b23eb5e3de4b11d43a14f720a4c4ebf9cd6c081"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.27/weave-darwin-amd64-0.1.27.tar.gz"
      sha256 "ef4482297ca182bed7a62f38a274a6ac816cdd5817a87658c369b0a31d4f2713"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
