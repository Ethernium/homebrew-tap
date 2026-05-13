cask "cemu" do
  version "2.6"
  sha256 "698c4b298f94983e4d6c30e9687ba8ff05094dd3930837c5104cddc0b0a49e4e"

  url "https://github.com/cemu-project/Cemu/releases/download/v#{version}/cemu-#{version}-macos-12-x64.dmg",
      verified: "github.com/cemu-project/Cemu/"
  name "Cemu"
  desc "Wii U emulator"
  homepage "https://cemu.info/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Cemu.app"
end
