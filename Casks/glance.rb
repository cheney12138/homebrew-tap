cask "glance" do
  version "0.4.4"
  sha256 "08e2a7252753790d9f74dafc2eb9fd70aa06ac8c2aaef6b73887b4effb7d5875"

  url "https://github.com/cheney12138/glance/releases/download/v#{version}/Glance-#{version}.dmg"
  name "Glance"
  desc "Per-display, window-level app switcher"
  homepage "https://github.com/cheney12138/glance"

  auto_updates true
  depends_on macos: :sonoma

  app "Glance.app"

  caveats <<~EOS
    Glance is signed but not notarized. Homebrew installs it without the macOS
    quarantine flag, so it should open normally. If macOS still refuses:
      xattr -dr com.apple.quarantine "/Applications/Glance.app"
  EOS
end
