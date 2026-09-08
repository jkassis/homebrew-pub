class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.35/jarhead-darwin-arm64-0.1.35.tar.gz"
    sha256 "b6d50aeb25f8663208edd60223b8a941bedb31071c5e174236747a7c5208d753"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.35/jarhead-darwin-amd64-0.1.35.tar.gz"
    sha256 "0afcd5b8c52915f11395efe80a0b821f0343ba02dbadb0b1d588dcb73970c615"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.35", shell_output("#{bin}/jarhead --version")
  end
end
