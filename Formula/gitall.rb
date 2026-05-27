class Gitall < Formula
  desc "CLI for operating on groups of git repositories"
  homepage "https://github.com/jkassis/gitall"
  version "0.8.29"
  revision 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/gitall/releases/download/0.8.29/gitall-darwin-10.10-arm64-1.0.1.tar.gz"
      sha256 "63aaaed05b93ae6a06f44906268607563963c420b8a71c4c5b4e893bb4c5f933"
    else
      url "https://github.com/jkassis/gitall/releases/download/0.8.29/gitall-darwin-10.10-amd64-1.0.1.tar.gz"
      sha256 "83729761f94df1bbcf640ef0e037c4c563af9fc7f7c96a658c3d55eb428305be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/gitall/releases/download/0.8.29/gitall-linux-arm64-1.0.1.tar.gz"
      sha256 "4d20f1d7410c9622d624792b1d90f003e64236ef721d25cd34d741cda40e5bc3"
    else
      url "https://github.com/jkassis/gitall/releases/download/0.8.29/gitall-linux-amd64-1.0.1.tar.gz"
      sha256 "a7a8a7dd34b6361958c68ca6d2223f7f5e2c2f9fa39b168540ff2b4b75b442ad"
    end
  end

  def install
    bin.install Dir["*"]
  end
end
