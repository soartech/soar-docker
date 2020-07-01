#!/bin/sh

set -e

apk add --no-cache python2-dev g++ swig tcl-dev libarchive-tools openjdk8 patch

mkdir -p /src/soar

cd /src/soar

wget -c https://github.com/SoarGroup/Soar/archive/development.zip -O - | bsdtar --strip-components=1 -xvf-


export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
export PATH="$JAVA_HOME/bin:${PATH}"

# This patch corrects for the differences between musl libc
# (which is provided with alpine) and glibc.
patch -p1 -i ../musl-soar.patch

python /src/soar/scons/scons.py --tcl=/usr kernel cli scripts sml_python sml_tcl sml_java headers tclsoarlib

mkdir -p /opt

mv out soar

tar czvf soar-alpine.tgz soar
