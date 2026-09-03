class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.32/jarhead-darwin-arm64-0.1.32.tar.gz"
      sha256 "df576a9781aa84343273e75ae0880aa2bd4b8c7ef954aa94dc2e01ff61e13491"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.32/jarhead-darwin-amd64-0.1.32.tar.gz"
      sha256 "e57b7aafa6bc5d98509395cf67f0c6b1cca6db35d3893e641196ac0059ebc1f8"
    end
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.32", shell_output("#{bin}/jarhead --version")
  end
end
