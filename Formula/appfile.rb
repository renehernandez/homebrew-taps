class Appfile < Formula
    desc "Deploy App specs to DigitalOcean App Platform"
    homepage "https://github.com/renehernandez/appfile"
    url "https://github.com/renehernandez/appfile.git", tag: "v0.0.4", revision: "521ecb4e1bceef5368035c9c4be03970795c5ac3"
    license "MIT"

    depends_on "go" => :build

    def install
        system "go", "build", "-ldflags", "-X github.com/renehernandez/appfile/internal/version.Version=#{version "v0.0.4"}",
        "-o", bin/"appfile", "-v", "github.com/renehernandez/appfile"
    end

    test do
        assert_match version.to_s, shell_output("#{bin}/appfile -v")
    end
end