class Wthis < Formula
  desc "What the heck is in my Homebrew list?"
  homepage "https://codeberg.org/eltrac/wthis"
  url "https://codeberg.org/eltrac/wthis/archive/v0.2.1.tar.gz"
  sha256 "871d72186653d3e39ea1b841872c8f450c8908631d36e1e32db6195f8d84b8bc"
  license "MIT"
  head "https://codeberg.org/eltrac/wthis.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/wthis --version 2>&1")
    assert_match "0.2.1", output
  end
end
