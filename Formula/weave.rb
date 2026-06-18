class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.25/weave-darwin-arm64-0.1.25.tar.gz"
      sha256 "10a0b63acfb03570051ca5ae4fa6afbf5b7f750385fd669231cc086699488984"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.25/weave-darwin-amd64-0.1.25.tar.gz"
      sha256 "b75a7a7293a0d7f5571932eeff3d42bbc7bfa6e34ba123de080f1808051f62bd"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
