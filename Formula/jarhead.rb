class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.60/jarhead-darwin-arm64-0.1.60.tar.gz"
    sha256 "e972a0fea7a69a21ee404dc33dc6e04187c088f6bf6372410be7a31d2d289614"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.60/jarhead-darwin-amd64-0.1.60.tar.gz"
    sha256 "eccd3894fbb59ec1141b74560350ccaba67468cf932c3c029f617e972004a363"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.60", shell_output("#{bin}/jarhead --version")
  end
end
