class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.40/jarhead-darwin-arm64-0.1.40.tar.gz"
    sha256 "71157f95ac06181ae7b3f195858b69d380027ce530d160e4e388b564e0a1773c"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.40/jarhead-darwin-amd64-0.1.40.tar.gz"
    sha256 "cb31016c445b0d194b822d157aaf90dc81f687bc940a3d0420913c2615d4c029"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.40", shell_output("#{bin}/jarhead --version")
  end
end
