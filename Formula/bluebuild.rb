class Bluebuild < Formula
  desc "CLI tool for creating Containerfile templates for ostree-based atomic distros"
  homepage "https://blue-build.org/"
  url "https://github.com/blue-build/cli/archive/refs/tags/v0.9.42.tar.gz"
  sha256 "fb0a506c50198b421362e885b7fdbb12aba1d82904c38cd6a34dc5d510a0c2b6"
  license "Apache-2.0"
  head "https://github.com/blue-build/cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"bluebuild", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bluebuild --version")
  end
end
