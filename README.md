# gluezilla-mac

## Install the Library Binary
Copy every item in `libgluezilla-mac-bin` to `/usr/local/lib/`.
```
$  cp -a libgluezilla-mac-bin/. /usr/local/lib/
```

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

Double click `install.command` in Finder or use the following command to build and install libgluezilla:
```
$ ./install.command
```
> If there's an execute permission issue, run `chmod +x install.command` to make it executable.
