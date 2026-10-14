cask "glance" do
  version "0.4.6"
  sha256 "318037d5ffe6287d7698ca134d5a34ab1c8a4fd0b72f2d631015003d24a814c0"

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
