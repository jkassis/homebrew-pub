class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.29/weave-darwin-arm64-0.1.29.tar.gz"
      sha256 "e423e9b46b018723f6a6ab39b901129a7d069af27cc10803e0859909ac56de2d"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.29/weave-darwin-amd64-0.1.29.tar.gz"
      sha256 "385bccbda719723c45fbb3654df757008cee166f6827b70bec757c5fd4afdf3b"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
