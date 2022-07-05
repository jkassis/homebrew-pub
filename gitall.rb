# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Gitall < Formula
  desc ""
  homepage "https://github.com/jkassis/homebrew-tap"
  version "0.5.13"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jkassis/gitall/releases/download/v0.5.13/gitall_0.5.13_darwin_amd64.tar.gz"
      sha256 "9e678f11497e5f46597a93e1a904b09095123812a1ee04c51f00214abcebcbc7"

      def install
        bin.install "gitall"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jkassis/gitall/releases/download/v0.5.13/gitall_0.5.13_darwin_arm64.tar.gz"
      sha256 "22cc57742b3ca37b69bcda40d38ebe0628f662595548dde17c22232732ae47ae"

      def install
        bin.install "gitall"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/v0.5.13/gitall_0.5.13_linux_arm64.tar.gz"
      sha256 "11c9b7f0646cd8ea6b296ce7d8af08f6af902bf04a551db16ae25724ef0fdab1"

      def install
        bin.install "gitall"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jkassis/gitall/releases/download/v0.5.13/gitall_0.5.13_linux_amd64.tar.gz"
      sha256 "2633e1d8fe6c562af07fbb46bbe5226eefee7382a1d30ce4f2c65b4e4e2e72be"

      def install
        bin.install "gitall"
      end
    end
  end
end
