class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.16/weave-darwin-arm64-0.1.16.tar.gz"
      sha256 "544986ee8bae9997c917c1f1d5dfb7bfb8a196b30b60782b5737a96617f24f40"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.16/weave-darwin-amd64-0.1.16.tar.gz"
      sha256 "7d9d9cabede390ca5c7ab5acd2d961020a0bedadd6e70b56538e91766e4d19ab"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
