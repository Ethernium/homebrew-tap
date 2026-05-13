cask "ryujinx" do
  version "1.3.3"
  sha256 "e4818bb84c98e0d3120691821e90772099e46101273d3f145ffdb10eee2c0dbb"

  url "https://git.ryujinx.app/projects/Ryubing/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz",
      verified: "git.ryujinx.app/projects/Ryubing/"

  name "Ryujinx"
  desc "Open-source Nintendo Switch emulator"
  homepage "https://git.ryujinx.app/projects/Ryubing"

  livecheck do
    # Point to the Forgejo API endpoint for releases
    url "https://git.ryujinx.app/api/v1/repos/Ryubing/Ryujinx/releases"

    strategy :json do |json|
      # The API returns an array of releases. The first one is usually the latest.
      latest = json.first
      next if latest.nil?

      # Get the tag name (e.g., "v1.3.3" or "1.3.3")
      tag = latest["tag_name"]
      next if tag.nil?

      # Remove leading 'v' if present to match Homebrew versioning
      tag.sub(/^v/, "")
    end
  end

  app "Ryujinx.app"

  conflicts_with cask: "ryujinx-canary"
end