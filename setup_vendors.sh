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

[ ! -d ./vendors ] && mkdir vendors

git submodule init && git submodule update

### Submodule specific commands

# auto-complete
# Git recursive submodule stuff is a crock of shit...
#
#git submodule sync vendors/auto-complete;
#(cd vendors/auto-complete;  \
#    git submodule init && git submodule update; \
#    cp lib/*/*.el .; \
#    "${EMACS}" --batch -f batch-byte-compile *.el)

(cd vendors/; 
    git clone https://github.com/auto-complete/auto-complete; \
    cd auto-complete; \
    git submodule init; git submodule update;\
    find lib -name '*.el' -exec cp {} . \; ;\
    emacs -Q -L . -batch -f batch-byte-compile *.el )

# w3
[ -x /usr/bin/autoconf ] || ${SUDO} apt-get install -y autoconf
[ -x /usr/bin/w3m ]      || ${SUDO} apt-get install -y w3m
(cd vendors/w3; autoconf && ./configure; \
    echo "(provide 'emacspeak-fix-interactive)" > lisp/emacspeak-fix-interactive.el; \
    make; sudo make install lispdir="~/.emacs.d/vendors/w3")


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

# Pylookup
if [[ "${MACHTYPE}" =~ cygwin ]]; then
    (cd vendors/pylookup; \
        wget http://docs.python.org/2.7/archives/python-2.7.3-docs-html.zip; \
        unzip python-2.7.2-docs-html.zip; \
        PYDOCSDIR=./python-2.7.2-docs-html )
else
    ${SUDO} apt-get install python2.6-doc
    if [ ! -x /usr/bin/python2 ]; then
        latest_python_2=`ls -1 /usr/bin/python2.* | sed -n '$p'`
        ln -s ${latest_python_2} /usr/bin/python2
    fi
    PYDOCSDIR=/usr/share/doc/python2.6/html
fi

(cd vendors/pylookup; \
    ./pylookup.py -u ${PYDOCSDIR})

(cd vendors/git-emacs; \
    make all)
