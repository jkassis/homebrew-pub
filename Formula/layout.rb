class Layout < Formula
  desc "macOS window layout manager with multi-space support and browser tab restore"
  homepage "https://github.com/jkassis/layout"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/layout/releases/download/v0.1.0/layout-darwin-arm64-0.1.0.tar.gz"
      sha256 "e19d388fc6e5697ccf400a262ede3c9b65017dc51664679581f86e52d1c53a5a"
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
