class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.37/weave-darwin-arm64-0.1.37.tar.gz"
      sha256 "bd3c8bf35aa82b0b46fb6709ef837dae6f06d357adfdc23521b378161fff0bc0"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.37/weave-darwin-amd64-0.1.37.tar.gz"
      sha256 "7d7043bd1728304a2dc00f2e113a1798ed7765e63647b50f491e00816d77eac4"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "weave 0.1.37", shell_output("#{bin}/weave --version")
  end
end
