class Appfile < Formula
    desc "Deploy App specs to DigitalOcean App Platform"
    homepage "https://github.com/renehernandez/appfile"
    url "https://github.com/renehernandez/appfile.git", tag: "v0.0.8", revision: "68580ebb4b6ca01fc9c753f36c6fa26629a51222"
    license "MIT"

    depends_on "go" => :build

    def install
        system "go", "build", "-ldflags", "-X github.com/renehernandez/appfile/internal/version.Version=#{version "v0.0.8"}",
        "-o", bin/"appfile", "-v", "github.com/renehernandez/appfile"
    end

    test do
        assert_match version.to_s, shell_output("#{bin}/appfile -v")
    end
end