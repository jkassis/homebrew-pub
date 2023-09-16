
	class Gitall < Formula
		desc ""
		homepage "https://github.com/jkassis/gitall"
		version "0.8.24"

	  on_macos do

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.24/gitall-darwin-amd64-1.0.1.tar.gz"
      sha256 "62a32ffce19e86467e8b975c927a90c86c0ffad9e75a1bed445ecc3fa87a3217"

      def install
        bin.install "gitall-darwin-amd64-1.0.1" => "gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.24/gitall-darwin-arm64-1.0.1.tar.gz"
      sha256 "1aa27ee981b5b56baaf6c3c48b94295ff7ff44996af9fff3fb3bf2f408d0c2b6"

      def install
        bin.install "gitall-darwin-arm64-1.0.1" => "gitall"
      end
    end

  end

  on_linux do

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.24/gitall-linux-amd64-1.0.1.archlinux"
      sha256 "e62ae2e8a49ed85683da9d290be9c1a32d3359135474e13b54e5a47ff3710b61"

      def install
        bin.install "gitall-linux-amd64-1.0.1.archlinux" => "gitall"
      end
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.24/gitall-linux-amd64-1.0.1.tar.gz"
      sha256 "a79aae5b87399a4353f928439ff37c419c99e80f34ae38ecd4f781dedc797521"

      def install
        bin.install "gitall-linux-amd64-1.0.1" => "gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.24/gitall-linux-arm64-1.0.1.archlinux"
      sha256 "e85c96a742b2aaf16e7d6a103f0fd275f3c4133d013166a719c24635e595389e"

      def install
        bin.install "gitall-linux-arm64-1.0.1.archlinux" => "gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.24/gitall-linux-arm64-1.0.1.tar.gz"
      sha256 "aa4eca159ae1f25fd203b9a52ae3a10e31aaa8829c09f9331232604b583c2f2a"

      def install
        bin.install "gitall-linux-arm64-1.0.1" => "gitall"
      end
    end

  end
end
