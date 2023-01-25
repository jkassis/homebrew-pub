
# typed: false
# frozen_string_literal: true
# This file was generated by gitall.
class Gitall < Formula
  desc ""
  homepage "https://github.com/jkassis/gitall"
  version "0.8.11"

  on_macos do

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/v0.8.11/gitall-darwin-10.10-amd64.tar.gz"
      sha256 "984f7edbe560de793e5d0d75e8b961aea37e1d2312858862d29e82fcb7eb38a5"

      def install
        bin.install "gitall-darwin-10.10-amd64" => "gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/v0.8.11/gitall-darwin-10.10-arm64.tar.gz"
      sha256 "d4090e087b84c7309fb1983de09b5de6772316fb9eff6091f6ec7815c4510c31"

      def install
        bin.install "gitall-darwin-10.10-arm64" => "gitall"
      end
    end

  end

  on_linux do

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/v0.8.11/gitall-linux-amd64.tar.gz"
      sha256 "46a66e0a705ab42f24055d02be4e91fd0db9224a2e0ad14a38af24f9b37a3fa2"

      def install
        bin.install "gitall-linux-amd64" => "gitall"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jkassis/gitall/releases/download/v0.8.11/gitall-linux-arm64.tar.gz"
      sha256 "9b3cfff8271d5edae04abf7f01e8cd4a30393c20e76d0bdeeb7261655551fcc6"

      def install
        bin.install "gitall-linux-arm64" => "gitall"
      end
    end

  end
end
