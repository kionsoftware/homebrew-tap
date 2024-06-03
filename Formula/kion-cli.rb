# Copyright (c) Kion Software

# This file was auto generated. DO NOT EDIT.
class KionCli < Formula
  desc "Kion on the command-line!"
  homepage "https://github.com/kionsoftware/kion-cli"
  version "0.3.0"
  license "MIT"

  url "https://github.com/kionsoftware/kion-cli/archive/v0.3.0.tar.gz"
  sha256 "f408eca149444d828b8eff6fe7ac5af2fdf418244148d4cb54edd84324f4f508"
  head "https://github.com/kionsoftware/kion-cli"

  depends_on "go" => :build

  def install
    zsh_completion.install "_kion"
    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/kionsoftware/kion-cli"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", "#{bin}/kion", "."
    end
  end

  test do
    system "#{bin}/kion", "--version"
  end
end
