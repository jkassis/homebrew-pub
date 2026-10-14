class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.114/jarhead-darwin-arm64-0.1.114.tar.gz"
    sha256 "ed6d4b45de359d772cbb5ced3b30a0a0dbe101d9781bd530fc6b4249770e697b"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.114/jarhead-darwin-amd64-0.1.114.tar.gz"
    sha256 "77814f42bb83b7b3c9721e7b8d278a23cb03c90c8a0456efb2059be0eed5915b"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.114", shell_output("#{bin}/jarhead --version")
  end
end
