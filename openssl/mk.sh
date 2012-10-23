#!/bin/sh
VER=1.0.1c
tar xvfz openssl-${VER}.tar.gz
pushd openssl-${VER}

./config --prefix=../openssl
make
popd
mkdir -p openssl/bin
cp -a openssl-${VER}/include ./
cp -a openssl-${VER}/{libssl.a,libcrypto.a} ../../cybozulib/lib/.
