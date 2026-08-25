class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.28/jarhead-darwin-arm64-0.1.28.tar.gz"
      sha256 "7897794775e3fbc981f124a23f4222f64094e1677ccd6c83a36b082f1b374bef"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.28/jarhead-darwin-amd64-0.1.28.tar.gz"
      sha256 "aa03294758ab53b7b4c739510ceb265bafff95c6c23be218a3efdb165d4982cd"
    end
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.28", shell_output("#{bin}/jarhead --version")
  end
end
