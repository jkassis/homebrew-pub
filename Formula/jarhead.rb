class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.109/jarhead-darwin-arm64-0.1.109.tar.gz"
    sha256 "ea138888300ead0e7c9097e96fa92a90be82a499feafdce97bb48fe63ab73a92"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.109/jarhead-darwin-amd64-0.1.109.tar.gz"
    sha256 "43e929ad89e41f100cd0ab66759f292682df3b25be0ad9bb5359064939a1570e"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.109", shell_output("#{bin}/jarhead --version")
  end
end
