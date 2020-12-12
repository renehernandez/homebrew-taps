class Appfile < Formula
    desc "Deploy App specs to DigitalOcean App Platform"
    homepage "https://github.com/renehernandez/appfile"
    url "https://github.com/renehernandez/appfile.git", tag: "v0.0.5", revision: "9c7e8efc06ee1e397137600a0eebdc31b28ad9dd"
    license "MIT"

    depends_on "go" => :build

    def install
        system "go", "build", "-ldflags", "-X github.com/renehernandez/appfile/internal/version.Version=#{version "v0.0.5"}",
        "-o", bin/"appfile", "-v", "github.com/renehernandez/appfile"
    end

    test do
        assert_match version.to_s, shell_output("#{bin}/appfile -v")
    end
end