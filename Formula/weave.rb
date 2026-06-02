class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.13/weave-darwin-arm64-0.1.13.tar.gz"
      sha256 "c77165aacf9af0718866f4ec3b39d3a9cdf16bf1a30326e0b6b36380ce027d9e"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.13/weave-darwin-amd64-0.1.13.tar.gz"
      sha256 "53e82e231e74e93c750ff2d9ced29eebba1beba1c8a816188b9143951f013392"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
