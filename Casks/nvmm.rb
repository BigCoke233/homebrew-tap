cask "nvmm" do
  version "1.6.1"
  sha256 "a3b4a3c8bb3f4e68278c46367e64d4b85be209fc211c0d1a705eab2ca6f23736"

  url "https://github.com/sfsam/Nvmm/releases/download/#{version}/Nvmm.zip"
  name "Nvmm"
  desc "Neovim GUI with GPU text rendering"
  homepage "https://github.com/sfsam/Nvmm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Nvmm.app"

  binary "#{appdir}/Nvmm.app/Contents/bin/nvmm"

  zap trash: [
    "~/Library/Caches/com.mowglii.Nvmm",
    "~/Library/Preferences/com.mowglii.Nvmm.plist",
    "~/Library/Saved Application State/com.mowglii.Nvmm.savedState",
  ]
end
