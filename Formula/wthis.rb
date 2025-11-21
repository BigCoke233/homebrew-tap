class Wthis < Formula
  desc "What the heck is in my Homebrew list?"
  homepage "https://github.com/BigCoke233/wthis"
  url "https://github.com/BigCoke233/wthis/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "485261fd3490c1a24e2b6ac47bc03bbf108ca02dacf9a4763af46649aa182f9b"
  license "MIT"
  head "https://github.com/BigCoke233/wthis.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/wthis --version 2>&1")
    assert_match "0.1.1", output
  end
end
