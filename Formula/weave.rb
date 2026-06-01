class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.8/weave-darwin-arm64-0.1.8.tar.gz"
      sha256 "a87df84048fae883216c3739417066bea5ceeb92b7edcfe23ced9972426127bf"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.8/weave-darwin-amd64-0.1.8.tar.gz"
      sha256 "42080eaf2b4c452d60ad65f1ee3ea356062ffe0bd4ecc92b35f580830682196a"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
