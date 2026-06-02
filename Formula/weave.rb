class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.9/weave-darwin-arm64-0.1.9.tar.gz"
      sha256 "6dabe98a1452bbcb40f06eb1952fc554e4ee8d03560df8695b9a9e4a5611fead"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.9/weave-darwin-amd64-0.1.9.tar.gz"
      sha256 "80fd72ac698a3ab2fc4723dbf0e1b7adfdaecc1426534fb9ee3aae91b3ae9a98"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
