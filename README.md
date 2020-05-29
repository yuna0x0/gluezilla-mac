# gluezilla-mac

## Build from source
Before starting, make sure you install the following packages and any dependencies:
```
pkg-config
$ brew install pkg-config

Gtk+ 2.0
$ brew install gtk

mono
$ brew cask install mono-mdk

Mozilla NSPR
$ brew install nspr

Mozilla NSS
$ brew install nss
```
`make`, `autoconf`, `automake`, `libtool` should also be installed.

---

Double click `build-install.command` in Finder or use the following command to build and install libgluezilla:
```
$ ./build-install.command
```
> If there's an execute permission issue, run `chmod +x build-install.command` to make it executable.

## Install the Library Binary
> Notice: Install only the Library Binary might not work, as libgluezilla depends on some libraries that your system might not yet install.

> Use the instruction in "Build from source" section as possible.

Copy every item in `libgluezilla-mac-bin` to `/usr/local/lib/`.
```
$  cp -a libgluezilla-mac-bin/. /usr/local/lib/
```
