class Appfile < Formula
  desc "Deploy App specs to DigitalOcean App Platform"
  homepage "https://github.com/renehernandez/appfile"
  url "https://github.com/renehernandez/appfile.git", tag: "v0.0.9", revision: "5636c84d474fae2b41d3dfef24a84ab33ad6565a"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X github.com/renehernandez/appfile/internal/version.Version=#{version "v0.0.9"}",
           "-o", bin/"appfile", "-v", "github.com/renehernandez/appfile"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/appfile -v")
  end
end
