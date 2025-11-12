class Wthis < Formula
  desc "🍻 What the heck is in my Homebrew list?"
  homepage "https://github.com/BigCoke233/wthis"
  url "https://github.com/BigCoke233/wthis/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8bd886cdd9ac564441459db6fff3358f69442bf2fb0ea587c496c63ac5442242"
  license "MIT"
  head "https://github.com/BigCoke233/wthis.git", branch: "main"

  depends_on "go" => :build

  def install
    # Compile the binary
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/wthis"
  end

  test do
    # Verify that the binary runs and outputs expected info
    output = shell_output("#{bin}/wthis --version 2>&1")
    assert_match "0.1.0", output
  end
end
