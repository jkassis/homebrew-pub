class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.22/weave-darwin-arm64-0.1.22.tar.gz"
      sha256 "14d9c07f967dcff50513b21c8142ac9087026a61b6fe764577119162004c253e"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.22/weave-darwin-amd64-0.1.22.tar.gz"
      sha256 "7bafa2d7aac49db5c8b27914ad2c1cbe7f3cc5cc47118f685b8551ee4128344c"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
