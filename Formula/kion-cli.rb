# Copyright (c) Kion Software

# This file was auto generated. DO NOT EDIT.
class KionCli < Formula
  desc "Kion on the command-line!"
  homepage "https://github.com/kionsoftware/kion-cli"
  version "0.2.0"
  license "MIT"

  url "https://github.com/kionsoftware/kion-cli/archive/v0.2.0.tar.gz"
  sha256 "3be9a74a5c6ab1c801ec56720a62f4133c9fb317147ada9d98fc4558646c858f"
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
