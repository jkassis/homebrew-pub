class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.28/weave-darwin-arm64-0.1.28.tar.gz"
      sha256 "c7d35abae55e12cabaa7d666de837c34dc205b240150e36efa936541d4d0425d"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.28/weave-darwin-amd64-0.1.28.tar.gz"
      sha256 "0ba9db424877621588ba5757fd928b44859a88330388465ad9c4c2a904079e96"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
