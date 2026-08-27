class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.29/jarhead-darwin-arm64-0.1.29.tar.gz"
      sha256 "7e35a685855e54bca09e0b6b92ca523a1ebb8bced673f81ee38398fdab60967c"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.29/jarhead-darwin-amd64-0.1.29.tar.gz"
      sha256 "423260e0902ed5d043ddca19d183a334df14a4b73a117ae2ed20dd13234eda05"
    end
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.29", shell_output("#{bin}/jarhead --version")
  end
end
