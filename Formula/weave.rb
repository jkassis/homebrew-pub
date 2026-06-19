class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.26/weave-darwin-arm64-0.1.26.tar.gz"
      sha256 "86ba0fa3e8f534f71fa9e6f4b7b7ab8b62edd29493f5a72405676e51112f4a10"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.26/weave-darwin-amd64-0.1.26.tar.gz"
      sha256 "6b616b599540f45bbba309d9ffad1be0428539dd7ece575b9342a2ec2e8829c5"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
