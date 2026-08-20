class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.12/jarhc-darwin-arm64-0.1.12.tar.gz"
      sha256 "2fa4296199e3118be031034dcbf40a7da5fd6a8c5a6d2be7b449fb0590b10b27"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.12/jarhc-darwin-amd64-0.1.12.tar.gz"
      sha256 "9239a06272e6e33ab5e5f3b73f78ca5a8e7078bac24b52f68deae8f299249167"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.12", shell_output("#{bin}/jarhc --version")
  end
end
