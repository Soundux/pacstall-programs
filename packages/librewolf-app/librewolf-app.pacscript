#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="librewolf-app"
pkgname="librewolf"
version="97.0.1-1"
description="A fork of Firefox, focused on privacy, security and freedom."
url="https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/latest/LibreWolf.x86_64.AppImage"
hash="a05b9f67e1bac4e3e342d15f106af21b7493432971a253c74df3baf07c3fb14a"
breaks="${pkgname}-deb ${pkgname}-bin ${pkgname}-git"
pkgdir="${STOWDIR}/${name}"

prepare() {
  true
}

build() {
  true
}

install() {
  # Install appimage
  sudo install -Dm755 "LibreWolf.x86_64.AppImage" "${pkgdir}/usr/bin/${pkgname}"

  # Download icon
  wget -q https://librewolf-community.gitlab.io/images/logo.png
  sudo install -Dm644 "logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install .desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

removescript() {
  # Delete .librewolf
  if ask "Do you want to delete ~/.librewolf/ files?" Y; then
    rm -rf ~/.librewolf/
  fi
}
# vim:set ft=sh ts=2 sw=2 et:
