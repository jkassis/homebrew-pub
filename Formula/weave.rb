class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.10/weave-darwin-arm64-0.1.10.tar.gz"
      sha256 "60b78c308c13d769145584da9d8f84c1a5c5cf84c273362d05be1b8783a0d14b"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.10/weave-darwin-amd64-0.1.10.tar.gz"
      sha256 "c284f4d15f066d450cd62741f9cf2430cc3d888d39fa892f7bb80e7be336ceef"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
