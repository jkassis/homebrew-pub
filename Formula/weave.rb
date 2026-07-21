class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.35/weave-darwin-arm64-0.1.35.tar.gz"
      sha256 "0fe35cd1b7e99c4b49117c77a41bf10f21d9eb1e92726a907e305c2ea046610e"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.35/weave-darwin-amd64-0.1.35.tar.gz"
      sha256 "4a7b9d1d9cebc4b6b2089fbacfbbf1d41532abdf9c547830949ad79fc384e945"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "weave 0.1.35", shell_output("#{bin}/weave --version")
  end
end
