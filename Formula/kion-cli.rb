# Copyright (c) Kion Software

# This file was auto generated. DO NOT EDIT.
class KionCli < Formula
  # formula metadata
  desc "Kion on the command-line!"
  homepage "https://github.com/kionsoftware/kion-cli"
  version "0.9.0"
  license "MIT"

  # nightly build, install with --HEAD
  head "https://github.com/kionsoftware/kion-cli"

  # latest release
  url "https://github.com/kionsoftware/kion-cli/archive/v0.9.0.tar.gz"
  sha256 "c30bd16e8ae03149a94ca875acb28f03ed10c13848318e58c910e39dbc7ad589"

  # build dependencies
  depends_on "go" => :build

  # installation
  def install
    zsh_completion.install "_kion"
    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/kionsoftware/kion-cli"
    bin_path.install Dir["*"]
    cd bin_path do
      if build.head?
        version = "nightly-" + `git rev-parse --short HEAD`.chomp
      else
        version = File.read("#{buildpath}/src/github.com/kionsoftware/kion-cli/VERSION.md").chomp
      end
      system "go", "build", "-ldflags", "-X main.kionCliVersion=#{version}", "-o", "#{bin}/kion", "."
    end
  end

  # test install
  test do
    system "#{bin}/kion", "--version"
  end
end
