# Homebrew cask for the Mac Storage Dashboard app.
#
# NOTE: this file is a TEMPLATE. The release workflow
# (.github/workflows/release.yml) fills in version + sha256 and copies it to
# Casks/mac-storage-dashboard.rb in the tap repo on every release — edit the
# template here, not the generated file in the tap.
cask "mac-storage-dashboard" do
  version "1.1.1"
  sha256 "062d192e981b283451e1e3c37254cf8317aaa223acd54aee7b7584040c5fc8d8"

  url "https://github.com/Irfanwani/mac-storage-dashboard/releases/download/v#{version}/Mac-Storage-Dashboard.zip"
  name "Mac Storage Dashboard"
  desc "Local, privacy-friendly disk dashboard: treemap, junk detection, safe cleanup"
  homepage "https://github.com/Irfanwani/mac-storage-dashboard"

  # the app is a small native launcher around the bundled Python server
  depends_on formula: "python"

  app "Mac Storage Dashboard.app"

  zap trash: [
    "~/Library/Application Support/Mac Storage Dashboard",
  ]
end
