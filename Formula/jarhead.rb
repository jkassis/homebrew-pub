class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.27/jarhead-darwin-arm64-0.1.27.tar.gz"
      sha256 "b8bc7ba6f747602d8c0e3427fc1deb27c385055cc52e0e2c8536172cec657fd0"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.27/jarhead-darwin-amd64-0.1.27.tar.gz"
      sha256 "e119d475a91165d802dbb248481287ba5ac22f5d7007a8689f0dc355639a355d"
    end
  end

  def install
    bin.install "bin/jarhead"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.27", shell_output("#{bin}/jarhead --version")
  end
end
