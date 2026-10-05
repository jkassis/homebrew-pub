class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.110/jarhead-darwin-arm64-0.1.110.tar.gz"
    sha256 "b23d300683e56f4bea4685b0e640cc0fbd1cc208369b977ee6ace316e0be2092"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.110/jarhead-darwin-amd64-0.1.110.tar.gz"
    sha256 "19af5f7eaf7d5f443d20f325bd61e67286a62c4d6273a6fd31eac957c532331a"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.110", shell_output("#{bin}/jarhead --version")
  end
end
