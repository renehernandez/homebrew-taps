class Appfile < Formula
    desc "Deploy App specs to DigitalOcean App Platform"
    homepage "https://github.com/renehernandez/appfile"
    url "https://github.com/renehernandez/appfile.git", tag: "v0.0.8", revision: "c86149d470d31c4b860cbcf4cbf6f80e029a3a21"
    license "MIT"

    depends_on "go" => :build

    bottle do
        root_url "https://homebrew.bintray.com/bottles-taps"
        sha256 cellar: :any_skip_relocation, catalina: "915504dc0d70c636546b198ebe88c89a002f44bf5254b4483f8d88104548be70"
        sha256 cellar: :any_skip_relocation, mojave: "7f9c4626d997f47d9114dcc5b538a4940877dcd5e038b95c6013743b2e5dde78"
    end

    def install
        system "go", "build", "-ldflags", "-X github.com/renehernandez/appfile/internal/version.Version=#{version "v0.0.8"}",
        "-o", bin/"appfile", "-v", "github.com/renehernandez/appfile"
    end

    test do
        assert_match version.to_s, shell_output("#{bin}/appfile -v")
    end
end