class Wthis < Formula
  desc "What the heck is in my Homebrew list?"
  homepage "https://github.com/BigCoke233/wthis"
  url "https://github.com/BigCoke233/wthis/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
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
