class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.41/jarhead-darwin-arm64-0.1.41.tar.gz"
    sha256 "a774224638591189ba33232a81caa20d19f53ebbb7d4f9714388ded8c2eb8c2d"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.41/jarhead-darwin-amd64-0.1.41.tar.gz"
    sha256 "4ac2fbf832dd8d9266491013545c34df1b551ee5e6a7feca4d7298ae5361c6b8"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.41", shell_output("#{bin}/jarhead --version")
  end
end
