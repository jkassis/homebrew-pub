class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.4/weave-darwin-arm64-0.1.4.tar.gz"
      sha256 "3a88652d1c358c34bcbd3855f4124e351dbc879a9ac9f505d5f18a1b803dda3a"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.4/weave-darwin-amd64-0.1.4.tar.gz"
      sha256 "c5af3300d559d2133aa1a3f2f43db2cf2e1b33a6622215c2a3eccf3a77403b0c"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
