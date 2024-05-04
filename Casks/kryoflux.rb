cask "kryoflux" do
  version "3.50"
  sha256 "526b1b1d39e2d2447d4806166aa4920da1424b76a5193a2d393dca643a649cad"

  url "https://www.kryoflux.com/download/kryoflux_#{version}_macosx.dmg"
  name "KryoFlux"
  desc "Host Software - DiskTool Console (dtc) and UI"
  homepage "https://www.kryoflux.com/"

  livecheck do
    url "https://www.kryoflux.com/?page=download"
    regex(%r{href=.*?/kryoflux[._-]v?(\d+(?:\.\d+)+)[._-]macosx\.dmg}i)
  end

  app "KryoFlux UI.app"
  pkg "KryoFlux.pkg"

  uninstall pkgutil: "com.kryoflux.pkg.DTC"

  zap trash: [
    "~/.kryoflux",
    "~/Library/Preferences/com.kryoflux.kryoflux-ui.plist",
    "~/Library/Preferences/com.kryoflux.ui.plist",
  ]

  caveats do
    files_in_usr_local
  end
end
