class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.38/weave-darwin-arm64-0.1.38.tar.gz"
      sha256 "910ba6915f9cf23a16d4162ffdabadfc8825d6df4f3a02d9ba481fb5147d7b11"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.38/weave-darwin-amd64-0.1.38.tar.gz"
      sha256 "710bf35026c49f78855b6616d080297f2de86a3478e2ae05294643cc8034318f"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "weave 0.1.38", shell_output("#{bin}/weave --version")
  end
end
