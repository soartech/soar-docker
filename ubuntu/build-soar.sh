#!/bin/sh

set -e

apt update
apt install -y --no-install-recommends python2-dev g++ swig tcl-dev libarchive-tools wget openjdk-8-jdk

mkdir -p /src/soar

cd /src/soar

wget --no-check-certificate -c https://github.com/SoarGroup/Soar/archive/development.zip -O - | bsdtar --strip-components=1 -xvf-

patch -p1 -i ../soar-tcl-path.patch

python2 /src/soar/scons/scons.py --tcl=/usr kernel cli scripts sml_python sml_tcl sml_java headers tclsoarlib

mv out soar

tar czvf soar-ubuntu.tgz soar
