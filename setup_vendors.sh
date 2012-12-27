#!/bin/bash

if [ -z "$MACHTYPE" ]; then
    MACHTYPE=`uname -s`
fi

if [[ "$MACHTYPE" =~ cygwin ]]; then
    SUDO=''
    EMACS="/cygdrive/c/Program Files (x86)/emacs-24.1/bin/emacs"
else
    SUDO=sudo
    EMACS=emacs
fi

git submodule init && git submodule update

### Submodule specific commands

# auto-complete
git submodule sync vendors/auto-complete;
(cd vendors/auto-complete;  \
    git submodule init && git submodule update; \
    cp lib/*/*.el .; \
    "${EMACS}" --batch -f batch-byte-compile *.el)


# emacs-w3m
[ -x /usr/bin/autoconf ] || ${SUDO} apt-get install -y autoconf
(cd vendors/emacs-w3m; autoconf && ./configure; make)


# Pymacs, Rope, etc.

(cd vendors/pymacs; make; ${SUDO} make install; \
    "${EMACS}" --batch -f batch-byte-compile pymacs.el)

if [ ! -x /usr/bin/easy_install ]; then
    if [[ "$MACHTYPE" =~ cygwin ]]; then
        wget http://peak.telecommunity.com/dist/ez_setup.py
        python ez_setup.py
    else
        ${SUDO} apt-get install python-setuptools
    fi
fi

${SUDO} easy_install \
    "http://pypi.python.org/packages/source/r/rope/rope-0.9.4.tar.gz"
${SUDO} easy_install \
    "http://pypi.python.org/packages/source/r/ropemacs/ropemacs-0.7.tar.gz"
${SUDO} easy_install \
    "http://pypi.python.org/packages/source/r/ropemode/ropemode-0.2.tar.gz"

