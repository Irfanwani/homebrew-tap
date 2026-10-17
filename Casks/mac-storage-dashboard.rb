# Homebrew cask for the Mac Storage Dashboard app.
#
# NOTE: this file is a TEMPLATE. The release workflow
# (.github/workflows/release.yml) fills in version + sha256 and copies it to
# Casks/mac-storage-dashboard.rb in the tap repo on every release — edit the
# template here, not the generated file in the tap.
cask "mac-storage-dashboard" do
  version "1.1.2"
  sha256 "8f1d0a6d6dc0160819bf783fed4856ceccf0a9d90fae84ad93bff192a62af4b1"

  url "https://github.com/Irfanwani/mac-storage-dashboard/releases/download/v#{version}/Mac-Storage-Dashboard.zip"
  name "Mac Storage Dashboard"
  desc "Local, privacy-friendly disk dashboard: treemap, junk detection, safe cleanup"
  homepage "https://github.com/Irfanwani/mac-storage-dashboard"

  # the app is a small native launcher around the bundled Python server
  depends_on formula: "python"

  app "Mac Storage Dashboard.app"

  caveats <<~EOS
    This app is not notarized by Apple yet, so macOS blocks its first launch
    ("Apple could not verify ..."). To allow it, either:

      - click "Done" on the warning, then allow the app under
        System Settings -> Privacy & Security -> "Open Anyway", or
      - remove the quarantine flag in Terminal:

          xattr -dr com.apple.quarantine "#{appdir}/Mac Storage Dashboard.app"

    Repeat after every `brew upgrade`, which quarantines the new download.
  EOS

  zap trash: [
    "~/Library/Application Support/Mac Storage Dashboard",
  ]
end
