class Weave < Formula
  desc "Local-first terminal and agent collaboration TUI"
  homepage "https://github.com/jkassis/homebrew-pub"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.21/weave-darwin-arm64-0.1.21.tar.gz"
      sha256 "1e9f4766c7022c551c14a08398ad4c858d9245b955f36eab47414c30d27d3a73"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/weave-v0.1.21/weave-darwin-amd64-0.1.21.tar.gz"
      sha256 "b090f5dfbf242c866d4a5bea922a96ba0315336358c655da3327323b5a1c5c3f"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "usage: weave", shell_output("#{bin}/weave --help 2>&1", 1)
  end
end
