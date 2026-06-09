class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.18/weave-darwin-arm64-0.1.18.tar.gz"
      sha256 "cc9a8e1c72b486c4dba8b9e4239414fab0d808dc60ed11abea0a6ef96774c3e6"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.18/weave-darwin-amd64-0.1.18.tar.gz"
      sha256 "3be452e383c99adb44ffbbaf5f07351a2708edf8bb71f0426b071ff1ac5df612"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
