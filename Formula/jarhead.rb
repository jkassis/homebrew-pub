class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.22/jarhead-darwin-arm64-0.1.22.tar.gz"
      sha256 "3895f64c4a630ed068e5dab5dae66b1f488e8c5c0d93da9c02eecc2bb4cf94f0"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.22/jarhead-darwin-amd64-0.1.22.tar.gz"
      sha256 "eea87f56c469065d21520fd833665d6b848ae3a316af78470e11bb385328a799"
    end
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.22", shell_output("#{bin}/jarhead --version")
  end
end
