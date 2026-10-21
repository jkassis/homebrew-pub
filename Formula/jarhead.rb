class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.121/jarhead-darwin-arm64-0.1.121.tar.gz"
    sha256 "35b5cbe771a64543bc5c4330fdd4286e5871689b1d5eca93b9cc374ea1e5be22"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.121/jarhead-darwin-amd64-0.1.121.tar.gz"
    sha256 "0f409f5b83222e8ddd1196cc65dd6fcc6bb60264b7984ea55be6596532bf4728"
  end

  def install
    bin.install "bin/jarhead"
    prefix.install "bin/jarhead-modules"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.121", shell_output("#{bin}/jarhead --version")
    assert_path_exists prefix/"jarhead-modules/modules.lock.json"
    assert_match 'aliases = ["agents", "agent"]', (prefix/"jarhead-modules/jarhead.profiles/module.toml").read
  end
end
