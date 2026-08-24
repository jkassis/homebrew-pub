class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.25/jarhead-darwin-arm64-0.1.25.tar.gz"
      sha256 "c8dcb3b9b9542749bcc0df853b725fcd5ab08dd38a85faea910b1af78e975946"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.25/jarhead-darwin-amd64-0.1.25.tar.gz"
      sha256 "2bd26b9f81cedca76ccb134af1f9ccd10d6a445aa8fcb6aafb9db5f9ec7f438b"
    end
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.25", shell_output("#{bin}/jarhead --version")
  end
end
