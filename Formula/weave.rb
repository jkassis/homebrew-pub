class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.5/weave-darwin-arm64-0.1.5.tar.gz"
      sha256 "7941ef14d426cf8bc65e1e6f16b8654db67e0b5022a6f61b6e5dc99bb30e271d"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.5/weave-darwin-amd64-0.1.5.tar.gz"
      sha256 "eae3743e8577e09f0c93ca5b716c811bc087280d21de69f4ffb0f7c8846d56f4"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
