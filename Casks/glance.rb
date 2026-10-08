cask "glance" do
  version "0.4.5"
  sha256 "a30c824b0ef0c1badb8e9b95c95179ea3a4299dac51fc0fcb3e002df947a1cbd"

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
