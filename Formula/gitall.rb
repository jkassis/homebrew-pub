
	class Gitall < Formula
		desc ""
		homepage "https://github.com/jkassis/gitall"
		version "v0.8.21"

	  on_macos do

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/v0.8.21/gitall-darwin-10.10-amd64.tar.gz"
      sha256: "2fd006924e8e919a160f16961f9805416dd7a1df0504262b5c4d8be9969b5748"

      def install
        bin.install "gitall-darwin-10.10-amd64" => "gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/v0.8.21/gitall-darwin-10.10-arm64.tar.gz"
      sha256: "c737fd3a80b690079294d48726be72be3af2142307497615bb335e3c5663df3e"

      def install
        bin.install "gitall-darwin-10.10-arm64" => "gitall"
      end
    end

  end

  on_linux do

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/v0.8.21/gitall-linux-amd64.tar.gz"
      sha256: "aa7695fb0d61ce059c803d1f9c6e069c4778218be1dc3889175d32b99298dfb4"

      def install
        bin.install "gitall-linux-amd64" => "gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/v0.8.21/gitall-linux-arm64.tar.gz"
      sha256: "678701c8942c38f34773e50290db2399d30191629fd31bbc595f50fa64cbc26b"

      def install
        bin.install "gitall-linux-arm64" => "gitall"
      end
    end

  end
end
