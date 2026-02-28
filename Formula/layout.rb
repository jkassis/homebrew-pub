class Layout < Formula
  desc "macOS window layout manager with multi-space support and browser tab restore"
  homepage "https://github.com/jkassis/layout"
  url "https://github.com/jkassis/layout/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "22a95f8e061be686d88f1edecd9b540fa272233de462fab7dcdd94208c00245c"
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
