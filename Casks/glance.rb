cask "glance" do
  version "0.1.2"
  sha256 "3cf1541b6358a5780e93ebd3894f17b6ffe300cbf6f7ecc8f0684bfc96d975ce"

  url "https://github.com/cheney12138/glance/releases/download/v#{version}/Glance-#{version}.dmg"
  name "Glance"
  desc "Per-display, window-level app switcher"
  homepage "https://github.com/cheney12138/glance"

  # 自己带 Sparkle 更新器(README「Updating」一节)⇒ 告诉 brew 不必替它做更新检查。
  # 与 LumaRing 的 cask 同一处理:有自更新的 App 都该标 auto_updates。
  auto_updates true
  depends_on macos: :sonoma

  app "Glance.app"

  # 签名但**未公证**(没有 $99 开发者账号)。Homebrew 用自己下载的文件、通常不带 quarantine
  # 标记,所以正常能开;万一系统还是拦,给一条能直接粘的命令。
  caveats <<~EOS
    Glance is signed but not notarized (no Apple Developer account).

    Homebrew DOES add the macOS quarantine flag, so the first launch may be
    refused by Gatekeeper. Install with this flag to avoid it:
      brew reinstall --cask --no-quarantine cheney12138/tap/glance

    If it is already installed, either reinstall with the flag above, or run:
      xattr -dr com.apple.quarantine "/Applications/Glance.app"
  EOS
end
