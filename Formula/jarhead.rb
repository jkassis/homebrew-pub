class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.122/jarhead-darwin-arm64-0.1.122.tar.gz"
    sha256 "7da558339ef60e0daf4a61b84714f72db1681e41b1279df84f6925c33d15da30"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.122/jarhead-darwin-amd64-0.1.122.tar.gz"
    sha256 "b27bc0866488d68c8d699c947da6aaea78dc586c9289c8cf2ce60d325f312845"
  end

  def install
    bin.install "bin/jarhead", "bin/jarhead-preview-worker", "bin/jarhead-opencode-control-bridge"
    prefix.install "bin/jarhead-modules"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.122", shell_output("#{bin}/jarhead --version")
    assert_predicate bin/"jarhead-opencode-control-bridge", :executable?
    bridge = pipe_output("#{bin}/jarhead-opencode-control-bridge --address 127.0.0.1:1 --token smoke", '{"jsonrpc":"2.0","id":1,"method":"initialize"}')
    assert_match "jarhead-canonical-controls", bridge
    %w[gas-browser.js gas-browser_bg.wasm gas-font.ttf].each do |asset|
      assert_path_exists libexec/"jarhead/gas-browser"/asset
    end
    assert_predicate bin/"jarhead-preview-worker", :executable?
    assert_equal '{"Ok":null}', pipe_output("#{bin}/jarhead-preview-worker --receipt-io", '{"type":"read","path":"' + (testpath/"missing-receipt.json").to_s + '"}')
    assert_path_exists prefix/"jarhead-modules/modules.lock.json"
    assert_match 'aliases = ["agents", "agent"]', (prefix/"jarhead-modules/jarhead.profiles/module.toml").read
  end
end
