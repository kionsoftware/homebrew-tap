# Copyright (c) Kion Software

# This file was auto generated. DO NOT EDIT.
class KionCli < Formula
  desc "Kion on the command-line!"
  homepage "https://github.com/kionsoftware/kion-cli"
  version "0.1.1"
  license "MIT"

  url "https://github.com/kionsoftware/kion-cli/archive/v0.1.1.tar.gz"
  sha256 "6c34457d51df948ccddfc74d8df5ffdf75bfad025a268948bd5c27ea5a386c15"
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
