class Layout < Formula
  desc "macOS window layout manager with multi-space support and browser tab restore"
  homepage "https://github.com/jkassis/layout"
  version "0.1.2"
  license "MIT"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/homebrew-pub/releases/download/layout-v0.1.2/layout-darwin-arm64-0.1.2.tar.gz"
      sha256 "c175edb1d24fab974aa003da46065f006f3bbdf235ef280df1f0f80b56b13843"
    end
  end

  def install
    bin.install "layout"
  end

  def caveats
    <<~EOS
      To start the menu bar agent on login:
        layout agent install

      To remove it:
        layout agent uninstall

      Accessibility permissions are required. On first run, macOS will
      prompt you to grant access in System Settings > Privacy & Security > Accessibility.
    EOS
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/layout --help")
  end
end
