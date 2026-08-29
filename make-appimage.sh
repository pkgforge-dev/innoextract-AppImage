#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q innoextract | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://constexpr.org/innoextract/images/icon_128.png
export USE_HOST_DRIVERS_EXPERIMENTAL=1

# Deploy dependencies
quick-sharun /usr/bin/innoextract

# Turn AppDir into AppImage
quick-sharun --make-appimage
