class Jarhc < Formula
  desc "Terminal client for native Codex and Claude agent runtimes"
  homepage "https://github.com/jkassis/homebrew-pub"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.17/jarhc-darwin-arm64-0.1.17.tar.gz"
      sha256 "028f2823c1c13fe401fe7f66ba1852a2c04a04549b969ea6da7d2dad403e6cf9"
    end

    if Hardware::CPU.intel?
      url "https://github.com/jkassis/homebrew-pub/releases/download/jarhc-dist-v0.1.17/jarhc-darwin-amd64-0.1.17.tar.gz"
      sha256 "1f128b949c9d39dc412c79c07659a4cb05fcee2466812c8126f1278261e02efb"
    end
  end

  def install
    bin.install "bin/jarhc"
    libexec.install "libexec/jarhc"
  end

  test do
    assert_match "jarhc 0.1.17", shell_output("#{bin}/jarhc --version")
  end
end
