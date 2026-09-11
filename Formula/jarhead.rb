class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.39/jarhead-darwin-arm64-0.1.39.tar.gz"
    sha256 "edbeab1f4cfa6bac407963c6ea63c02fdf9042f2ff6748c41c2fce59501c11df"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.39/jarhead-darwin-amd64-0.1.39.tar.gz"
    sha256 "9aa666632b98f8a62b77fd561168da0282d56ec147e87918d430228dba41a6a8"
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.39", shell_output("#{bin}/jarhead --version")
  end
end
