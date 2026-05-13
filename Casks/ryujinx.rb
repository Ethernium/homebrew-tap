cask "ryujinx" do
  version "1.3.3"
  sha256 "PASTE_REAL_SHA256_HERE"

  url "https://git.ryujinx.app/projects/Ryubing/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz",
      verified: "git.ryujinx.app/projects/Ryubing/"
  name "Ryujinx"
  desc "Open-source Nintendo Switch emulator"
  homepage "https://ryujinx.org/"

  livecheck do
    url "https://git.ryujinx.app/api/v1/repos/Ryubing/Ryujinx/releases"
    strategy :json do |json|
      latest = json.first
      next if latest.nil?
      tag = latest["tag_name"]
      next if tag.nil?
      tag.sub(/^v/, "")
    end
  end

  depends_on :macos

  app "Ryujinx.app"
  conflicts_with cask: "ryujinx-canary"
end