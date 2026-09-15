class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.43/jarhead-darwin-arm64-0.1.43.tar.gz"
    sha256 "5cc59c393387c9a8fe4a86496a4f6c49b7e34d86d183b105cf15ab7ea97d496f"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.43/jarhead-darwin-amd64-0.1.43.tar.gz"
    sha256 "86047c6b5d53c918382441e3338ab69725dd0f5459c76492cb93d8a8e148f3f4"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.43", shell_output("#{bin}/jarhead --version")
  end
end
