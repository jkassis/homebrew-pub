
	class Jerriedr < Formula
		desc ""
		homepage "https://github.com/jkassis/jerriedr"
		version "v0.2.14"

	  on_macos do

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/jerriedr/releases/download/v0.2.14/jerriedr_0.2.14_darwin_amd64.tar.gz"
      sha256 "2a3fc2722e930e08e2459fc7ea445b3f0848184b3d07c33bf726685b0dd55225"

      def install
			  libexec.install Dir["/"]
				bin.write_exec_script libexec/"bin/jerriedr"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/jerriedr/releases/download/v0.2.14/jerriedr_0.2.14_darwin_arm64.tar.gz"
      sha256 "e809aa90d807585f1ccb53f40d33c481850693cc581adf452158f0fdaa5fe2f6"

      def install
			  libexec.install Dir["/"]
				bin.write_exec_script libexec/"bin/jerriedr"
      end
    end

  end

  on_linux do

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/jerriedr/releases/download/v0.2.14/jerriedr_0.2.14_linux_amd64.tar.gz"
      sha256 "09f857139583cc09e28bf6742e6d061932a67a012033768852376425b6e3c3ec"

      def install
			  libexec.install Dir["/"]
				bin.write_exec_script libexec/"bin/jerriedr"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/jerriedr/releases/download/v0.2.14/jerriedr_0.2.14_linux_arm64.tar.gz"
      sha256 "0df7b883237e9b7cef96145b9fb76d8d5ad3c3d786a9d6eb357a746baba07ecb"

      def install
			  libexec.install Dir["/"]
				bin.write_exec_script libexec/"bin/jerriedr"
      end
    end

  end
end
