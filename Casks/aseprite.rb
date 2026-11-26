cask "aseprite" do
  version "1.3.18.6"
  sha256 "fa9dd07a0c2a5ec91a4166333296bbb9e5c237933b59875d0cfee849d2358306"

  url "https://github.com/aseprite/aseprite/releases/download/v#{version}/Aseprite-v#{version}-Source.zip"
  name "Aseprite"
  desc "Animated sprite editor & pixel art tool (built from source)"
  homepage "https://www.aseprite.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: [
    "cmake",
    "ninja",
  ]
  depends_on :macos

  app "build/bin/Aseprite.app"
  binary "#{appdir}/Aseprite.app/Contents/MacOS/aseprite"

  preflight_steps do
    run "./build.sh",
        args:           ["--auto", "--norun"],
        chdir:          "{{staged_path}}",
        writable_paths: ["{{staged_path}}"],
        network_access: true
  end

  zap trash: [
    "~/Library/Application Support/Aseprite",
    "~/Library/Preferences/org.aseprite.Aseprite.plist",
    "~/Library/Saved Application State/org.aseprite.Aseprite.savedState",
  ]
end
