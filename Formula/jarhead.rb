class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.36/jarhead-darwin-arm64-0.1.36.tar.gz"
    sha256 "8464fb0fc8789cd5ce082c09406869c053fb4933d48a53c00c87e237bc77bc2e"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.36/jarhead-darwin-amd64-0.1.36.tar.gz"
    sha256 "7d493f0e776af01279430e9d3f3bd9758e410cd3660714f2225a7792e45b0739"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.36", shell_output("#{bin}/jarhead --version")
  end
end
