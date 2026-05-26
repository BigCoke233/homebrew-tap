class Wthis < Formula
  desc "What the heck is in my Homebrew list?"
  homepage "https://codeberg.org/eltrac/wthis"
  url "https://codeberg.org/eltrac/wthis/archive/v0.2.0.tar.gz"
  sha256 "224e6ca66c7eed48c2de031ba3c9b11664bb4e309d61dfebb7b3cba8678df10b"
  license "MIT"
  head "https://codeberg.org/eltrac/wthis.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/wthis --version 2>&1")
    assert_match "0.2.0", output
  end
end
