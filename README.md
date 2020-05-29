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

XULRunner 2.0
(XULRunner will be installed directly from the provided build script)
(Or you can install it manually by copying 'XUL.framework' to '/Library/Frameworks/')
```
`make`, `autoconf`, `automake`, `libtool` should also be installed.

---

Use the following command to build and install libgluezilla:
```
$ ./build-libgluezilla
```
> If there's an execute permission issue, run `chmod +x build-libgluezilla` to make it executable.

Build libgluezilla without installing it by passing the `--no-install` flag:
```
$ ./build-libgluezilla --no-install
```

---

You can also build libgluezilla maually by going to `gluezilla-master` folder:
```
$ cd gluezilla-master
```
Invoke configure and make:
```
$ ./autogen.sh --enable-optimize=yes
$ make
```
Install libgluezilla:
```
$ make install
```

## Install the Library Binary
> Notice: Install only the Library Binary might not work, as libgluezilla depends on some libraries that your system might not yet install.

> Use the instruction in "Build from source" section as possible.

Copy every item in `libgluezilla-mac-bin` to `/usr/local/lib/`.
```
$ cp -a libgluezilla-mac-bin/. /usr/local/lib/
```
