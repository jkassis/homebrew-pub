
	class Gitall < Formula
		desc ""
		homepage "https://github.com/jkassis/gitall"
		version "0.8.27"

	  on_macos do

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.27/gitall-darwin-10.10-amd64-1.0.1.tar.gz"
      sha256 "569d3f8c7d04b9ffd6abc878076b78f1f1ed30f62fbe43585e3028f428bf8210"

      def install
        bin.install "usr/bin/gitall" => "gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.27/gitall-darwin-10.10-arm64-1.0.1.tar.gz"
      sha256 "1b1e952190d227fa4806ca90769f91c6251fbdb1dad50202b27a0415f66c6fd0"

      def install
        bin.install "usr/bin/gitall" => "gitall"
      end
    end

  end

  on_linux do

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.27/gitall-linux-amd64-1.0.1.archlinux"
      sha256 "78814a29b632616213b99b1cded04a05a99e72b09ff841ca333050144f6be456"

      def install
        bin.install "usr/bin/gitall" => "gitall"
      end
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.27/gitall-linux-amd64-1.0.1.tar.gz"
      sha256 "b6dee5d01f3f95459e293e76480a655403f65cdbfeccc039acd29106af5e9bfe"

      def install
        bin.install "usr/bin/gitall" => "gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.27/gitall-linux-arm64-1.0.1.archlinux"
      sha256 "49340f6cbb0f40ad35e7e026098010c8281783d5ff191c3283b46d4cae488b19"

      def install
        bin.install "usr/bin/gitall" => "gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.27/gitall-linux-arm64-1.0.1.tar.gz"
      sha256 "deceace4663f4a20f7d23dd032f34b682432aa79d43dbd4d942c534d4c6fcf3b"

      def install
        bin.install "usr/bin/gitall" => "gitall"
      end
    end

  end
end
