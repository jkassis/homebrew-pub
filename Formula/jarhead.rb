class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.117/jarhead-darwin-arm64-0.1.117.tar.gz"
    sha256 "5bf4edead3643bbf58a4160c3368655bc30b193b7020f9e7bcac68b19f686d3e"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.117/jarhead-darwin-amd64-0.1.117.tar.gz"
    sha256 "fcbe7912c2030c179d5e7df2d22317a7e0a45b8a599deab18dc4c0401281ed87"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.117", shell_output("#{bin}/jarhead --version")
  end
end
