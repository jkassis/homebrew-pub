class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  revision 1
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.119/jarhead-darwin-arm64-0.1.119.tar.gz"
    sha256 "961f98c3750171f54dfa24f6709a4127146cef23cedb8cc1cf6a0645a5201558"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.119/jarhead-darwin-amd64-0.1.119.tar.gz"
    sha256 "ee8af863a909a1d161a1e30c04725ae04c5c3d3cc40793344c07e9c481771766"
  end

  def install
    bin.install "bin/jarhead"
    prefix.install "bin/jarhead-modules"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.119", shell_output("#{bin}/jarhead --version")
    assert_path_exists prefix/"jarhead-modules/modules.lock.json"
    assert_match 'aliases = ["agents", "agent"]', (prefix/"jarhead-modules/jarhead.profiles/module.toml").read
  end
end
