cask "ryujinx-canary" do
  version "1.3.289"
  sha256 "d072396fb9f6370aefe737d649e9da89296075339d2c03ae502fb64f73c72d02"

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
