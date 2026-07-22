class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.36/weave-darwin-arm64-0.1.36.tar.gz"
      sha256 "cc582a1cd0e7e6426842d85ad796ee73357c70ca3748bb69c8a6b16b64196309"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.36/weave-darwin-amd64-0.1.36.tar.gz"
      sha256 "38092b0cea7c6f77329517d5365fb162ad9ef6cf21f7159abfb6c725f845d04b"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "weave 0.1.36", shell_output("#{bin}/weave --version")
  end
end
