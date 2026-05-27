class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.3/weave-darwin-arm64-0.1.3.tar.gz"
      sha256 "eea0b3aa4e0eba184a76ff19fabd0eec4f56d7436b20ba18f0477ced796030e5"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.3/weave-darwin-amd64-0.1.3.tar.gz"
      sha256 "e7ab825295689d161c4ae2b59798a0880649bbcb615376dc3d1e273c5ec1a975"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
