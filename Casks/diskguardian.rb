# DiskGuardian Homebrew CASK template — rendered by the `tap` job in
# .github/workflows/release.yml on every tag. The copy in madeinoz67/homebrew-tap is
# generated output: edit this file, never that one.
#
# Placeholders substituted at release time: 0.1.5, 90a2926cdf27a6e8b72197e1b1d19476590ba29cfec19b2645b80a612590f713, a7550571b10a2d45524bdbade0ee71cb4b1b3d403199adc789ac66e905f0f809.
#
# A cask, not a formula. The other tools in this tap are CLI binaries and belong in
# Formula/, but DiskGuardian is a GUI application shipped as a .app inside a dmg. A
# formula would have to install the bundle outside /Applications with no `app` stanza,
# which is the wrong shape for a windowed app and gets upgrade behaviour wrong.
#
# There is no `depends_on macos:` line on purpose. Tauri sets no minimum in
# tauri.conf.json and CI builds on a current runner, so naming a floor here would be a
# claim nothing in this repository measures.
cask "diskguardian" do
  version "0.1.5"
  name "DiskGuardian"
  desc "Sunburst view of what is actually filling your disk"
  homepage "https://github.com/madeinoz67/diskguardian"

  on_arm do
    sha256 "90a2926cdf27a6e8b72197e1b1d19476590ba29cfec19b2645b80a612590f713"
    url "https://github.com/madeinoz67/diskguardian/releases/download/v#{version}/DiskGuardian_#{version}_aarch64.dmg",
        verified: "github.com/madeinoz67/diskguardian/"
  end

  on_intel do
    sha256 "a7550571b10a2d45524bdbade0ee71cb4b1b3d403199adc789ac66e905f0f809"
    url "https://github.com/madeinoz67/diskguardian/releases/download/v#{version}/DiskGuardian_#{version}_x64.dmg",
        verified: "github.com/madeinoz67/diskguardian/"
  end

  app "DiskGuardian.app"

  caveats <<~EOS
    DiskGuardian is unsigned, so macOS quarantines the download. If Gatekeeper refuses
    the first launch, right-click the app and choose Open, or run:
      xattr -dr com.apple.quarantine "/Applications/DiskGuardian.app"
  EOS
end
