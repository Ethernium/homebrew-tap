cask "ryujinx" do
  version "1.3.3"
  sha256 "e4818bb84c98e0d3120691821e90772099e46101273d3f145ffdb10eee2c0dbb"

  url "https://git.ryujinx.app/Ryubing/Ryujinx/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Open-source Nintendo Switch emulator"
  homepage "https://git.ryujinx.app/Ryubing/Ryujinx"

  livecheck do
    url "https://git.ryujinx.app/api/v1/repos/Ryubing/Ryujinx/releases"
    strategy :json do |json|
      json.map { |release| release["tag_name"]&.sub(/^v/i, "") }
    end
  end

  conflicts_with cask: "ryujinx-canary"
  depends_on macos: :monterey

  app "Ryujinx.app"

  zap trash: [
    "~/Library/Application Support/Ryujinx",
    "~/Library/Logs/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
