cask "vesta-terminal" do
  version "0.1.42"
  sha256 "b631bda3715e515db7b44889c0168736a921e6d7d7c4fc9f9e03390abc74e88c"

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
