cask "wallux" do
  version "2.13.9"
  sha256 "1a5259671060482ef99cf276e51dff1b46595dc85741e02cbbab8ae31a0ec4d6"

  url "https://api.wallux.app/updates/Wallux-#{version}.dmg"
  name "Wallux"
  desc "Live desktop and lock screen wallpaper manager"
  homepage "https://wallux.app/"

  livecheck do
    url "https://api.wallux.app/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Wallux.app"

  zap trash: [
    "~/Library/Application Support/boosung.wallux",
    "~/Library/Application Support/Wallux",
    "~/Library/Caches/boosung.wallux",
    "~/Library/Caches/WalluxAssets",
    "~/Library/HTTPStorages/boosung.wallux",
    "~/Library/Preferences/boosung.wallux.plist",
    "~/Library/WebKit/boosung.wallux",
  ]
end
