class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.112/jarhead-darwin-arm64-0.1.112.tar.gz"
    sha256 "c5cc5659ec566f2341bf8454f206da20ec9d3183eec7ae4370eab35286314db5"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.112/jarhead-darwin-amd64-0.1.112.tar.gz"
    sha256 "4081abee3636b2caa820955287e620b7e7e9510990688ea9dee438471b3644ec"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.112", shell_output("#{bin}/jarhead --version")
  end
end
