class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.34/weave-darwin-arm64-0.1.34.tar.gz"
      sha256 "3acbc6d63dab95bd4de920f5b6f19e4e1263f062688981583043f1fb7e589b42"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.34/weave-darwin-amd64-0.1.34.tar.gz"
      sha256 "6024c36dc43ee5ed9606aec1a989d260e161d507131757bc3d8bd837babf1947"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "weave 0.1.34", shell_output("#{bin}/weave --version")
  end
end
