#!/bin/bash
rm -rf ~/emsdk
cd ~
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install 2.0.8
./emsdk activate 2.0.8
if ! grep -q "emsdk" $HOME/.bash_profile; then
  echo "source $(pwd)/emsdk_env.sh" >> $HOME/.bash_profile
fi
source ./emsdk_env.sh

