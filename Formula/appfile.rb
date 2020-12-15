class Appfile < Formula
    desc "Deploy App specs to DigitalOcean App Platform"
    homepage "https://github.com/renehernandez/appfile"
    url "https://github.com/renehernandez/appfile.git", tag: "v0.0.7", revision: "d2071180f7d14d0f9c8b53702a9d617755834603"
    license "MIT"

    depends_on "go" => :build

    def install
        system "go", "build", "-ldflags", "-X github.com/renehernandez/appfile/internal/version.Version=#{version "v0.0.7"}",
        "-o", bin/"appfile", "-v", "github.com/renehernandez/appfile"
    end

    test do
        assert_match version.to_s, shell_output("#{bin}/appfile -v")
    end
end