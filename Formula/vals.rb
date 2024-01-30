class Vals < Formula
  desc "Helm-like configuration values loader with support for various sources"
  homepage "https://github.com/helmfile/vals"
  url "https://github.com/helmfile/vals/archive/refs/tags/v0.33.0.tar.gz"
  sha256 "9b05c79f9f8799bc3ed4a0bee21d7d92a792fc2bab6d3eebe4f5430d91661138"
  license "Apache-2.0"
  version_scheme 1

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=v#{version}
      -X main.commit="brew"
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/vals"
  end

end
