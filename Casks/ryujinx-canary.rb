cask "ryujinx-canary" do
  version "1.3.341"
  sha256 "e84d5518b207c93a15a2fa94fe80c21e2efc236edc6ee9d82d9b8ac93153af39"

  url "https://git.ryujinx.app/Ryubing/Canary/releases/download/#{version}/ryujinx-canary-#{version}-macos_universal.app.tar.gz",
      verified: "git.ryujinx.app/Ryubing/Canary/"
  name "Ryujinx Canary"
  desc "Open-source Nintendo Switch emulator (Canary build)"
  homepage "https://git.ryujinx.app/Ryubing/Canary"

  livecheck do
    url "https://git.ryujinx.app/api/v1/repos/Ryubing/Canary/releases"
    strategy :json do |json|
      latest = json.first
      next if latest.nil?

      tag = latest["tag_name"]
      next if tag.nil?

      tag.sub(/^v/, "")
    end
  end

  conflicts_with cask: "ryujinx"
  depends_on macos: :monterey

  app "Ryujinx.app"
end
