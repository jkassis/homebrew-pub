class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.30/weave-darwin-arm64-0.1.30.tar.gz"
      sha256 "d80e1488c9086873c92677d7e23dc99fb6bee982053e25149a6d541c7f9d033d"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.30/weave-darwin-amd64-0.1.30.tar.gz"
      sha256 "e055e4e0c46da4cb59a7b537a9284d711e3592bf9bf4ace37025adfcf448fddb"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
