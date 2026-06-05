class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.15/weave-darwin-arm64-0.1.15.tar.gz"
      sha256 "418c39987d55f96526c1e852a49439ef7d1c2533daa60e6e742b8d7940d79d28"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.15/weave-darwin-amd64-0.1.15.tar.gz"
      sha256 "ebc2a3cbaec9b53fa5f9580d6815dd078071f20ffa44bfd5472b7ce62a6aec11"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
