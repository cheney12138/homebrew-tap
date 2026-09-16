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
  # 实测(Homebrew 7.0.1,2026-09-16):
  #   · `brew install --cask` **会**打上 com.apple.quarantine(agent = Homebrew Cask);
  #   · 已无 `--no-quarantine` 选项,也没有 HOMEBREW_NO_QUARANTINE 环境变量(两者都实测过)。
  # ⇒ Homebrew 并不能替未公证的 App 绕开 Gatekeeper,首次打开仍需用户动一次手。
  # 这段 caveats 就是"那次动手"的说明,brew 装完会自动打印。
  caveats <<~EOS
    Glance is signed but not notarized (no Apple Developer account), and
    Homebrew marks the download as quarantined, so macOS will refuse the first
    launch. Do ONE of these once:

      xattr -dr com.apple.quarantine "/Applications/Glance.app"

    or System Settings ▸ Privacy & Security ▸ "Open Anyway".

    After that it opens normally, and Glance updates itself (Sparkle) — its own
    updates are not quarantined, so you only do this for the first install.
  EOS
end
