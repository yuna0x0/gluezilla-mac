#!/usr/bin/env bash

cd -- "$(dirname "$0")"

if [[ $1 == "--no-install" ]]; then
    echo "Building libgluezilla without install."
    NO_INSTALL=true
else
    NO_INSTALL=false
fi

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

echo "Installing build require dependencies"
echo "Installing XUL.framework..."
echo "sudo cp -a XUL.framework /Library/Frameworks/"
if ! sudo cp -a XUL.framework /Library/Frameworks/; then
    echo -e "\033[0;31mError:\033[0m Failed to install XUL.framework. Aborting."
    echo "You might need to completely remove old XUL.framework folder to continue:"
    echo "sudo rm -rf /Library/Frameworks/XUL.framework"
    exit 1
fi

echo "Installing libxul-embedding pkg-config..."
echo "cp libxul-embedding.pc /usr/local/lib/pkgconfig/"
if ! cp libxul-embedding.pc /usr/local/lib/pkgconfig/; then
    echo -e "\033[0;31mError:\033[0m Failed to install libxul-embedding pkgconfig. Aborting."
    exit 1
fi

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

if ! $NO_INSTALL; then
    echo "Installing libgluezilla..."
    echo "make install"
    if ! make install; then
        echo -e "\033[0;31mError:\033[0m 'make install' failed. Aborting."
        exit 1
    fi
    echo "Successfully installed libgluezilla in '/usr/local/lib/'."
fi
