class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.31/weave-darwin-arm64-0.1.31.tar.gz"
      sha256 "860cda7f7735f8cb7a71d0e302e201379b768ca170791d154b6d1e677b4185cd"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.31/weave-darwin-amd64-0.1.31.tar.gz"
      sha256 "dbd9bd8780cea9bbf07471f43f8ad1b86ff7e36d527c4ca38d0def3ecd9041d0"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "weave 0.1.31", shell_output("#{bin}/weave --version")
  end
end
