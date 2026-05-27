class Wthis < Formula
  desc "What the heck is in my Homebrew list?"
  homepage "https://codeberg.org/eltrac/wthis"
  url "https://codeberg.org/eltrac/wthis/archive/v0.2.2.tar.gz"
  sha256 "f3e78273d33aecca87528cbdb242ad7c769d5fdc370b07205c7a163fb62a752e"
  license "MIT"
  head "https://codeberg.org/eltrac/wthis.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/wthis --version 2>&1")
    assert_match "0.2.2", output
  end
end
