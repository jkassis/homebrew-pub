class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.14/weave-darwin-arm64-0.1.14.tar.gz"
      sha256 "9aa22c626f74867ab9c115e8ecf5c197b1701d92e7be0cdd8bb4abc880a1e078"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.14/weave-darwin-amd64-0.1.14.tar.gz"
      sha256 "49d3207b842290a30c48080112f9e4fd1936645c1daf60f20976ea2742e9e583"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
