
	class Gitall < Formula
		desc ""
		homepage "https://github.com/jkassis/gitall"
		version "0.8.28"

	  on_macos do

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.28/gitall-darwin-10.10-amd64-1.0.1.tar.gz"
      sha256 "bfc90048137d712aa20fac69369474b714b3775e34ca8622289cb2c463f1af52"

      def install
			  libexec.install Dir["*"]
				bin.write_exec_script libexec/"bin/gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.28/gitall-darwin-10.10-arm64-1.0.1.tar.gz"
      sha256 "4fe94e4b010790987e277e224285109d074c5372c4ecb7038db8b5a2df5d84e6"

      def install
				bin.write_exec_script bin/"gitall"
      end
    end

  end

  on_linux do

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.28/gitall-linux-amd64-1.0.1.archlinux"
      sha256 "12a52bdc2341616ddf41b83cde92c56b146a2b204682b4ad6e16e9a7a6b93ed2"

      def install
			  libexec.install Dir["*"]
				bin.write_exec_script libexec/"bin/gitall"
      end
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.28/gitall-linux-amd64-1.0.1.tar.gz"
      sha256 "741ffdced05af23187a3450f9723a00a2dd50193d8341f3010240e2e64e32e10"

      def install
			  libexec.install Dir["*"]
				bin.write_exec_script libexec/"bin/gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.28/gitall-linux-arm64-1.0.1.archlinux"
      sha256 "79d5f9dafeb0d337173636aeabcf725a6eb00f035743fb6ef6e6165527defede"

      def install
			  libexec.install Dir["*"]
				bin.write_exec_script libexec/"bin/gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/0.8.28/gitall-linux-arm64-1.0.1.tar.gz"
      sha256 "d533ab1210e10c6ae0b8cb3b2c614319c267048ce202a6d8fb6fd6bc79636079"

      def install
			  libexec.install Dir["*"]
				bin.write_exec_script libexec/"bin/gitall"
      end
    end

  end
end
