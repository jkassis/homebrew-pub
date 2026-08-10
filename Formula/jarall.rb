class Jarall < Formula
  desc "Local terminal client for persistent Codex conversations"
  homepage "https://github.com/jkassis/jarhead"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/jarhead/releases/download/jarall-v0.1.0/jarall-darwin-arm64-0.1.0.tar.gz"
      sha256 "3e23079cbe2b73fc067152128d29c7dfbffcc8f082473eeeadf6c91b0d8eef65"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/jarhead/releases/download/jarall-v0.1.0/jarall-darwin-amd64-0.1.0.tar.gz"
      sha256 "2bc7e7e3916c741777979d8a03eb11c2b444a0dd25a292373079b947303181b5"
    end
  end

  def install
    bin.install "jarall"
  end

  def caveats
    <<~EOS
      JarAll requires the Codex CLI. Install and authenticate it with:
        brew install --cask codex
        codex login
    EOS
  end

  test do
    assert_match "jarall 0.1.0", shell_output("#{bin}/jarall --version")
  end
end
