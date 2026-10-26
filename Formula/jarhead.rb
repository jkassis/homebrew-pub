class Jarhead < Formula
  desc "Terminal frontend for native Codex, Claude, and JarAgent runtimes"
  homepage "https://github.com/jkassis/jarhead"
  depends_on :macos
  depends_on "node"

  if Hardware::CPU.arm?
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.132/jarhead-darwin-arm64-0.1.132.tar.gz"
    sha256 "e4bfe4cf63e044cd07d977601791d43300523daa48b87a230104bb273a46af18"
  else
    url "https://github.com/jkassis/homebrew-pub/releases/download/jarhead-dist-v0.1.132/jarhead-darwin-amd64-0.1.132.tar.gz"
    sha256 "41b02077b2ad046962d113e55ca47d3ffbd86e39157efc9417d04754528226f9"
  end

  def install
    bin.install "bin/jarhead", "bin/jarhead-preview-worker", "bin/jarhead-opencode-control-bridge"
    prefix.install "bin/jarhead-modules"
    libexec.install "libexec/jarhead"
  end

  test do
    assert_match "jarhead 0.1.132", shell_output("#{bin}/jarhead --version")
    assert_predicate bin/"jarhead-opencode-control-bridge", :executable?
    bridge = pipe_output("#{bin}/jarhead-opencode-control-bridge --address 127.0.0.1:1 --token smoke", '{"jsonrpc":"2.0","id":1,"method":"initialize"}')
    assert_match "jarhead-canonical-controls", bridge
    %w[gas-browser.js gas-browser_bg.wasm gas-font.ttf].each do |asset|
      assert_path_exists libexec/"jarhead/gas-browser"/asset
    end
    assert_predicate bin/"jarhead-preview-worker", :executable?
    assert_equal '{"Ok":null}', pipe_output("#{bin}/jarhead-preview-worker --receipt-io", '{"type":"read","path":"' + (testpath/"missing-receipt.json").to_s + '"}')
    job = {
      provider_scope: {lock_root: testpath.to_s}, layout: nil,
      identity: {room_id: "smoke", workspace_id: "smoke", relative_path: "README.md", source_revision: 1},
      source: {type: "buffer", text: "# Homebrew preview"}, provider: nil,
      document_kind: "text/markdown", extension: "md", parse_options: "", immediate: true
    }
    probe = pipe_output("#{HOMEBREW_PREFIX}/bin/jarhead-preview-worker", JSON.generate(job) + 10.chr + "null" + 10.chr)
    assert_equal "jarhead.preview-markdown", JSON.parse(probe.lines.first).fetch("Ok").fetch("provider").fetch("module_id")
    assert_path_exists prefix/"jarhead-modules/modules.lock.json"
    assert_match 'aliases = ["agents", "agent"]', (prefix/"jarhead-modules/jarhead.profiles/module.toml").read
  end
end
