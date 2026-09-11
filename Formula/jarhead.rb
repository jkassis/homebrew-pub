class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.38/jarhead-darwin-arm64-0.1.38.tar.gz"
    sha256 "bbbe7ade61f1963df304bcb396f516275159186af22aaff548a7e81627825047"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.38/jarhead-darwin-amd64-0.1.38.tar.gz"
    sha256 "7963037394ce28cd659ca597b66ff5af242f0c6c4d66c8a6c6ed8e12c646d283"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.38", shell_output("#{bin}/jarhead --version")
  end
end
