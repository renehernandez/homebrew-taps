class Appfile < Formula
  desc "Deploy App specs to DigitalOcean App Platform"
  homepage "https://github.com/renehernandez/appfile"
  url "https://github.com/renehernandez/appfile.git", tag: "v0.0.9", revision: "3a51d7641820aeacadd4521b4a7ceb5c1f64df1f"
  license "MIT"

  bottle do
    root_url "https://github.com/renehernandez/appfile/releases/download/v0.0.9"

    sha256 cellar: :any, catalina: "4d1b8af022c552cfc036a37c7bc883aa3dc8a5c4be7c6ee78c01baf055e17e42"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X github.com/renehernandez/appfile/internal/version.Version=#{version "v0.0.9"}",
           "-o", bin/"appfile", "-v", "github.com/renehernandez/appfile"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/appfile -v")
  end
end
