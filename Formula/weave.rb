class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.17/weave-darwin-arm64-0.1.17.tar.gz"
      sha256 "677ad95219d23ed4314779136b8d84720934cec56281b36e0ad0d1670b69aaef"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.17/weave-darwin-amd64-0.1.17.tar.gz"
      sha256 "349d717a43cc2a6a299c5c6e185b91f393dec8cfa694714dcb4b21a5c8e2f8ea"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
