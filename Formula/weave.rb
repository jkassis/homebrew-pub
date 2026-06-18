class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.24/weave-darwin-arm64-0.1.24.tar.gz"
      sha256 "8349e455f5fa07ede9bb365138d3013c1d9fa2c83feacd0912c398fc1ad05b40"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.24/weave-darwin-amd64-0.1.24.tar.gz"
      sha256 "8fe91b3e3f97977100d6b102fb14e186d52a4cbd668cad73972433413fdfba28"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
