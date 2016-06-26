#!/bin/bash

PIPVERSION="pip pip2 pip2.7"


# Search pip python 2 version
PIP2=""
for VERSION in $PIPVERSION
do
	if [ "$PIP2" == "" ]; then
        type $VERSION > /dev/null
        if [ $? == 0 ]; then
            $VERSION --version | grep "python 2."
            if [ $? == 0 ]; then
                PIP2="$VERSION"
            fi
        fi
    fi
done

PIPPATH=$(which $PIP2)

ln -sf "$PIPPATH" /usr/local/bin/my_pip2