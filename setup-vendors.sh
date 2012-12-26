#!/bin/sh

git submodule init && git submodule update

### Submodule specific commands

# auto-complete
git submodule sync vendors/auto-complete;
(cd vendors/auto-complete;  cp lib/*/*.el .; \
    emacs --batch -f batch-byte-compile *.el)


# emacs-w3m
(cd vendors/emacs-w3m; autoconf && ./configure; make)


# Pymacs, Rope, etc.

(cd vendors/pymacs; make; sudo make install; \
    emacs --batch -f batch-byte-compile pymacs.el)

[ -x /usr/bin/easy_install ] || sudo apt-get install python-setuptools

sudo easy_install \
    "http://pypi.python.org/packages/source/r/rope/rope-0.9.4.tar.gz"
sudo easy_install \
    "http://pypi.python.org/packages/source/r/ropemacs/ropemacs-0.7.tar.gz"
sudo easy_install \
    "http://pypi.python.org/packages/source/r/ropemode/ropemode-0.2.tar.gz"

