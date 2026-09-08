class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.37/jarhead-darwin-arm64-0.1.37.tar.gz"
    sha256 "8ed114919f66d7672290928b5aff51c74e7e340268872fcc77c9bd213c787336"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.37/jarhead-darwin-amd64-0.1.37.tar.gz"
    sha256 "6a9f0ee8d0a24216cc959d67549761046467fe64b9cbef7adbd47dfbde592ac7"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.37", shell_output("#{bin}/jarhead --version")
  end
end
