cask "happymode" do
  version "0.0.1"
  sha256 "8252e693bfda6f1533cc33cf89c251598da03bd48b8b169a420656612f3c049e"

  url "https://github.com/happytoolin/happymode/releases/download/v#{version}/happymode-v#{version}.zip"
  name "happymode"
  desc "Menu bar app that switches Light/Dark mode based on sunrise and sunset"
  homepage "https://github.com/happytoolin/happymode"

  app "happymode.app"
end
