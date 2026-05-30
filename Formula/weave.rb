class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.7/weave-darwin-arm64-0.1.7.tar.gz"
      sha256 "d22bd5cf447f3f0b4384226fe4c8c91386cd990d4bf6bec926d84c6968789a14"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.7/weave-darwin-amd64-0.1.7.tar.gz"
      sha256 "6c7ee2ac82b5a7e7c4e268aa658db0477c6650e26164a1f4d0770073a2475d73"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
