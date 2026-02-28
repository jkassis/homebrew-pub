class Layout < Formula
  desc "macOS window layout manager with multi-space support and browser tab restore"
  homepage "https://github.com/jkassis/layout"
  url "https://github.com/jkassis/layout/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cc874659735cd4389879b86d2245d86f5292d68a92a301a0e816e9d0ea3d9d58"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/layout"
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
