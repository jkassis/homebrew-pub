class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.61/jarhead-darwin-arm64-0.1.61.tar.gz"
    sha256 "e4f708057e8380c9a94e9db43d30239b296ff09665e00a8c3d7f4dbb460e16b8"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.61/jarhead-darwin-amd64-0.1.61.tar.gz"
    sha256 "cf5f5c9e8790e48547939c93bb21e6336990fc6e33082b80ab5c43ec20867192"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.61", shell_output("#{bin}/jarhead --version")
  end
end
