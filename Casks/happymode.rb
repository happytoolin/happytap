cask "happymode" do
  version "0.0.8"
  sha256 "11cfbfa23d7a0dcdbd829c123e224605384b1786e5edf5df0d4c2c095e3d17b1"

  url "https://github.com/happytoolin/happymode/releases/download/v#{version}/happymode-v#{version}.zip"
  name "happymode"
  desc "Menu bar app that switches Light/Dark mode based on sunrise and sunset"
  homepage "https://github.com/happytoolin/happymode"

  app "happymode.app"

  # Unsigned app: strip quarantine so Homebrew installs run without manual Gatekeeper bypass.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/happymode.app"]
  end

  caveats <<~EOS
    happymode is distributed unsigned (no Apple Developer ID).
    If macOS still blocks launch on your machine, run:
      xattr -dr com.apple.quarantine "/Applications/happymode.app"
  EOS
end
