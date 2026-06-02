class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.12/weave-darwin-arm64-0.1.12.tar.gz"
      sha256 "bd47b14bf0b4ecf0b856686af363ed7cd272e5ac164b59ae7e761f9bb763cf14"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.12/weave-darwin-amd64-0.1.12.tar.gz"
      sha256 "896f3cda5ac6003b08942546922e7ebb1aa8c1eda615579adf293619d09af27b"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
