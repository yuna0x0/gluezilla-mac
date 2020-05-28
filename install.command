#!/usr/bin/env bash
echo "Installing XUL.framework..."
echo "sudo cp -a XUL.framework /Library/Framework/"
sudo cp -a XUL.framework /Library/Framework/
echo "Installing libxul-embedding pkg-config..."
echo "cp libxul-embedding.pc /usr/local/lib/pkgconfig/"
cp libxul-embedding.pc /usr/local/lib/pkgconfig/
