class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.4/jarhc-darwin-arm64-0.1.4.tar.gz"
      sha256 "dd19c874e0417ffa17606b4a0b5bdaaecb69b6f748e1e47a9b6aef616192b625"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.4/jarhc-darwin-amd64-0.1.4.tar.gz"
      sha256 "87bd84fbfeb0e78e1b8786b9312a963b490f0e3825912d3450e3d68c1b1d3616"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.4", shell_output("#{bin}/jarhc --version")
  end
end
