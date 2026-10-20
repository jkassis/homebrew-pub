class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.120/jarhead-darwin-arm64-0.1.120.tar.gz"
    sha256 "6b6afc487b7577ccbaa88d670f7d7e7d67aaaf06c2fea788e7d1ae911b4fab07"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.120/jarhead-darwin-amd64-0.1.120.tar.gz"
    sha256 "b3c7160cf293a5c65443628493086ce7b49d082b7a337efe3578ad017d4f3dcf"
  end

  def install
    bin.install "bin/jarhead"
    prefix.install "bin/jarhead-modules"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.120", shell_output("#{bin}/jarhead --version")
    assert_path_exists prefix/"jarhead-modules/modules.lock.json"
    assert_match 'aliases = ["agents", "agent"]', (prefix/"jarhead-modules/jarhead.profiles/module.toml").read
  end
end
