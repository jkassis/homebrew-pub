class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.2/weave-darwin-arm64-0.1.2.tar.gz"
      sha256 "81f5a77bd2cbe88bd3f724cf29056106692d575893b1bc4e1e0c49e8e90f5fa2"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.2/weave-darwin-amd64-0.1.2.tar.gz"
      sha256 "a9173239fcd074ff298893f2672e341b9a2ba2169b580c374b781fe05a65fa9b"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
