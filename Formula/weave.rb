class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.23/weave-darwin-arm64-0.1.23.tar.gz"
      sha256 "7be9447b61dcd2e29de048efb3a9c17338d9677b6a60e800d907ff4c2319f23c"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.23/weave-darwin-amd64-0.1.23.tar.gz"
      sha256 "c2f77201c2a6476fcde17a1bea87a1fbf37ef02fb6aec10d2918950e2ee1c170"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
