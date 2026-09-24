cask "glance" do
  version "0.4.3"
  sha256 "f2cc9706317d722944d7b0914d86410d713552c1b530f9bc8bb3e218ba1825c0"

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
