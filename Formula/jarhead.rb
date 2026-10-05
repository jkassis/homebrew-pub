class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.111/jarhead-darwin-arm64-0.1.111.tar.gz"
    sha256 "ae2025b9ce617b6a62417f822b50a7a903e1760c5f95eeb245f70134b3477c73"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.111/jarhead-darwin-amd64-0.1.111.tar.gz"
    sha256 "e3b25791017bdca1ea0c2f1c332567a0ba5fadda2bf0554183ab93c56a7daa3b"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.111", shell_output("#{bin}/jarhead --version")
  end
end
