#!/usr/bin/env bash
cd -- "$(dirname "$0")"
if ! command -v pkg-config >/dev/null 2>&1; then
    echo -e "pkg-config is not installed. \033[1;31mAborting."
    exit 1
elif ! pkg-config gtk+-2.0; then
    echo -e "Gtk+ 2.0 is not installed. \033[1;31mAborting."
    exit 1
elif ! pkg-config mono; then
    echo -e "mono is not installed. \033[1;31mAborting."
    exit 1
elif ! pkg-config nspr; then
    echo -e "Mozilla NSPR is not installed. \033[1;31mAborting."
    exit 1
elif ! pkg-config nss; then
    echo -e "Mozilla NSS is not installed. \033[1;31mAborting."
    exit 1
fi
echo "Installing XUL.framework..."
echo "sudo cp -a XUL.framework /Library/Frameworks/"
sudo cp -a XUL.framework /Library/Frameworks/
echo "Installing libxul-embedding pkg-config..."
echo "cp libxul-embedding.pc /usr/local/lib/pkgconfig/"
cp libxul-embedding.pc /usr/local/lib/pkgconfig/
