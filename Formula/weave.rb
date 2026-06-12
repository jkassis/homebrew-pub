class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.19/weave-darwin-arm64-0.1.19.tar.gz"
      sha256 "69adc7251247781d53056efc8c9b1cf518f701f856b826b58afcc2196f202043"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.19/weave-darwin-amd64-0.1.19.tar.gz"
      sha256 "80dfea14ce8dc2fe233f9ba408b98576db36919545a5cf66c6b6f0ff4a6a0627"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
