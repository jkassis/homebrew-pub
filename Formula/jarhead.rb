class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.107/jarhead-darwin-arm64-0.1.107.tar.gz"
    sha256 "b9880c908ee945dc56415b06b881d361b714c726602be29926b7dbdbb1b70292"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.107/jarhead-darwin-amd64-0.1.107.tar.gz"
    sha256 "de1c4054709204f2b9fe4e8aca883aeb26307c74d7d5b183abfa05dd8caf3329"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.107", shell_output("#{bin}/jarhead --version")
  end
end
