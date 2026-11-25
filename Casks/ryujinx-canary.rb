cask "ryujinx-canary" do
  version "1.3.356"
  sha256 "d66306176d9838242228127ace7f78ba3f7991b539fed38f33bc22bf60b9a9aa"

  url "https://git.ryujinx.app/Ryubing/Canary/releases/download/#{version}/ryujinx-canary-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx Canary"
  desc "Open-source Nintendo Switch emulator (Canary build)"
  homepage "https://git.ryujinx.app/Ryubing/Canary"

  livecheck do
    url "https://git.ryujinx.app/api/v1/repos/Ryubing/Canary/releases"
    strategy :json do |json|
      json.map { |release| release["tag_name"]&.sub(/^v/i, "") }
    end
  end

  conflicts_with cask: "ryujinx"
  depends_on macos: :monterey

  app "Ryujinx.app"

  zap trash: [
    "~/Library/Application Support/Ryujinx",
    "~/Library/Logs/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
