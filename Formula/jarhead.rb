class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.34/jarhead-darwin-arm64-0.1.34.tar.gz"
    sha256 "57826f0f797acbb9aeeade0e23480c0b3d2fd8b80a86ba9b45bca9729ecee5da"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.34/jarhead-darwin-amd64-0.1.34.tar.gz"
    sha256 "ce270c81be4fcc2ec013f63b58b80c9b7f0951a2fd7e7fe3833fb25e2b67536b"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.34", shell_output("#{bin}/jarhead --version")
  end
end
