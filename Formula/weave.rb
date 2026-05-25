class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/weave"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.1/weave-darwin-arm64-0.1.1.tar.gz"
      sha256 "807115950aff541d424437942be427751f44669a628e91cf2e7e82fa19a82587"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.1/weave-darwin-amd64-0.1.1.tar.gz"
      sha256 "04d74ded3ffc07ceed9a62fa48a39c052f71c473e66feb55db56a4b03697b103"
    end
  end

  def install
    bin.install "weave"
  end
end
