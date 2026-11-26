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

    mkdir_p "{{staged_path}}/Aseprite.iconset"
    copy "{{staged_path}}/data/icons/ase16.png", "{{staged_path}}/Aseprite.iconset/icon_16x16.png"
    copy "{{staged_path}}/data/icons/ase32.png", "{{staged_path}}/Aseprite.iconset/icon_16x16@2x.png"
    copy "{{staged_path}}/data/icons/ase32.png", "{{staged_path}}/Aseprite.iconset/icon_32x32.png"
    copy "{{staged_path}}/data/icons/ase64.png", "{{staged_path}}/Aseprite.iconset/icon_32x32@2x.png"
    copy "{{staged_path}}/data/icons/ase128.png", "{{staged_path}}/Aseprite.iconset/icon_128x128.png"
    copy "{{staged_path}}/data/icons/ase256.png", "{{staged_path}}/Aseprite.iconset/icon_128x128@2x.png"
    copy "{{staged_path}}/data/icons/ase256.png", "{{staged_path}}/Aseprite.iconset/icon_256x256.png"
    copy "{{staged_path}}/data/icons/hd/asehd.png", "{{staged_path}}/Aseprite.iconset/icon_256x256@2x.png"
    copy "{{staged_path}}/data/icons/hd/asehd.png", "{{staged_path}}/Aseprite.iconset/icon_512x512.png"
    run "/usr/bin/iconutil",
        args:           [
          "-c", "icns",
          "{{staged_path}}/Aseprite.iconset",
          "-o", "{{staged_path}}/build/bin/Aseprite.app/Contents/Resources/Aseprite.icns"
        ],
        writable_paths: ["{{staged_path}}"]
  end

  zap trash: [
    "~/Library/Application Support/Aseprite",
    "~/Library/Preferences/org.aseprite.Aseprite.plist",
    "~/Library/Saved Application State/org.aseprite.Aseprite.savedState",
  ]
end
