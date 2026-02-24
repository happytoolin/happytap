cask "happymode" do
  version :latest
  sha256 :no_check

  url "https://github.com/happytoolin/happymode/releases/latest/download/happymode-latest.zip"
  name "happymode"
  desc "Menu bar app that switches Light/Dark mode based on sunrise and sunset"
  homepage "https://github.com/happytoolin/happymode"

  app "happymode.app"
end
