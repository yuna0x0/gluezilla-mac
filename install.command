#!/usr/bin/env bash
cd -- "$(dirname "$0")"
echo "Installing XUL.framework..."
echo "sudo cp -a XUL.framework /Library/Frameworks/"
sudo cp -a XUL.framework /Library/Frameworks/
echo "Installing libxul-embedding pkg-config..."
echo "cp libxul-embedding.pc /usr/local/lib/pkgconfig/"
cp libxul-embedding.pc /usr/local/lib/pkgconfig/
