cask "ryujinx-canary" do
  version "1.3.289"
  sha256 "e4818bb84c98e0d3120691821e90772099e46101273d3f145ffdb10eee2c0dbb"

  url "https://git.ryujinx.app/Ryubing/Canary/releases/download/#{version}/ryujinx-canary-#{version}-macos_universal.app.tar.gz",
      verified: "git.ryujinx.app/Ryubing/Canary/"

  name "Ryujinx Canary"
  desc "Open-source Nintendo Switch emulator (Canary build)"
  homepage "https://ryujinx.org/"

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

  app "Ryujinx.app"

  conflicts_with cask: "ryujinx"
end