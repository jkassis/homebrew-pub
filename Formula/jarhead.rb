class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.44/jarhead-darwin-arm64-0.1.44.tar.gz"
    sha256 "d1ff13905fd2130d033e15b162f89cdd59fedd7411ce86460b89d1a78a4ca238"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.44/jarhead-darwin-amd64-0.1.44.tar.gz"
    sha256 "6892c441625db50c820d56f5d6e06f39850bf4192baeebb28d304a7b66b52af3"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.44", shell_output("#{bin}/jarhead --version")
  end
end
