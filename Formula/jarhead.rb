class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.42/jarhead-darwin-arm64-0.1.42.tar.gz"
    sha256 "738654090d8c458461a08089c2cc059615bb7deb6898e97a27595609fbebb87d"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.42/jarhead-darwin-amd64-0.1.42.tar.gz"
    sha256 "8a6784d9870371a936420133586f9533c22365308895a576cc37dab1c82b6f37"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.42", shell_output("#{bin}/jarhead --version")
  end
end
