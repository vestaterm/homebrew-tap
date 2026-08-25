cask "vesta-terminal" do
  version "0.1.45"
  sha256 "826945317693c5d2dccc1ca3f1a8726d9da01c3ebc2806d3e11951ddc6a487e9"

  url "https://github.com/vestaterm/Vesta/releases/download/v#{version}/Vesta.dmg"
  name "Vesta"
  desc "Native terminal with persistent sessions, workspaces, and Lua plugins"
  homepage "https://github.com/vestaterm/Vesta"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Vesta ships its own in-app updater; brew upgrade also works (livecheck above).
  auto_updates true
  depends_on macos: :ventura

  app "Vesta.app"

  # The `vesta` CLI is the app binary itself (control verbs); expose it on PATH.
  binary "#{appdir}/Vesta.app/Contents/MacOS/vesta"

  zap trash: [
    "~/Library/Application Support/vesta",
    "~/.config/vesta",
  ]
end
