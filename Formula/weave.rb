class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.33/weave-darwin-arm64-0.1.33.tar.gz"
      sha256 "2d7fff20e2a28b472b4b6e501a997fc691e50fbb41a15d881cf2da9ba6945e89"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.33/weave-darwin-amd64-0.1.33.tar.gz"
      sha256 "542b03096ba5f0f3ad82f695337048d98029596c4a7d9b323d739f361d1dd8b5"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "weave 0.1.33", shell_output("#{bin}/weave --version")
  end
end
