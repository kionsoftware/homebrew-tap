# Copyright (c) Kion Software

# This file was auto generated. DO NOT EDIT.
class KionCli < Formula
  desc "Kion on the command-line!"
  homepage "https://github.com/kionsoftware/kion-cli"
  version "0.1.0"
  license "MIT"

  url "https://github.com/kionsoftware/kion-cli/archive/v0.1.0.tar.gz"
  sha256 "d3e5e07f762e15d178249711e33c9ad48df3744fe9cb1553d33542faa8a94f91"
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
