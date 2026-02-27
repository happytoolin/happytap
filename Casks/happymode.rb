cask "happymode" do
  version "0.0.5"
  sha256 "3c8a2a85e5335dd76a13f476c6bc310640eed68fc9fee3bb6391fd905a211113"

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
