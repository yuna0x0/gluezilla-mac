#!/usr/bin/env bash

cd -- "$(dirname "$0")"

if ! command -v pkg-config >/dev/null 2>&1; then
    echo -e "\033[0;31mError:\033[0m pkg-config is not installed. Aborting."
    exit 1
elif ! pkg-config gtk+-2.0; then
    echo -e "\033[0;31mError:\033[0m Gtk+ 2.0 is not installed. Aborting."
    exit 1
elif ! pkg-config mono; then
    echo -e "\033[0;31mError:\033[0m mono is not installed. Aborting."
    exit 1
elif ! pkg-config nspr; then
    echo -e "\033[0;31mError:\033[0m Mozilla NSPR is not installed. Aborting."
    exit 1
elif ! pkg-config nss; then
    echo -e "\033[0;31mError:\033[0m Mozilla NSS is not installed. Aborting."
    exit 1
fi

echo "Installing XUL.framework..."
echo "sudo cp -a XUL.framework /Library/Frameworks/"
sudo cp -a XUL.framework /Library/Frameworks/
echo "Installing libxul-embedding pkg-config..."
echo "cp libxul-embedding.pc /usr/local/lib/pkgconfig/"
cp libxul-embedding.pc /usr/local/lib/pkgconfig/

echo "cd gluezilla-master"
cd gluezilla-master

echo "./autogen.sh --enable-optimize=yes"
if ! ./autogen.sh --enable-optimize=yes; then
    echo -e "\033[0;31mError:\033[0m 'autogen.sh' failed. Aborting."
    exit 1
fi
echo "make"
if ! make; then
    echo -e "\033[0;31mError:\033[0m 'make' failed. Aborting."
    exit 1
fi
echo "Installing libgluezilla..."
echo "make install"
if ! make install; then
    echo -e "\033[0;31mError:\033[0m 'make install' failed. Aborting."
    exit 1
fi
echo "Successfully installed libgluezilla in '/usr/local/lib/'."
