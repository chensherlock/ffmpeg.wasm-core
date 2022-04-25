#!/bin/bash

set -eo pipefail

SCRIPT_ROOT=$(dirname $0)/wasm/build-scripts

run() {
  for name in $@; do
    echo -e "\n\e[1;36m==============================   $name   ==============================\e[0m"
    SECONDS=0
    $SCRIPT_ROOT/$name.sh
    duration=$SECONDS
    echo -e "[1;33m$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed.\e[0m"
  done
}

run-all() {
  SCRIPTS=(
    # install dependencies
    #install-deps
    #build-zlib
    #build-x264
    #build-x265
    #build-libvpx
    #build-wavpack
    build-lame
    #build-fdk-aac
    build-ogg
    build-vorbis
    #build-theora
    build-opus
    #build-libwebp
    #build-freetype2
    #build-fribidi
    #build-harfbuzz
    #build-libass
    #build-aom # disabled as it is extremely slow
    configure-ffmpeg-audio-only
    build-ffmpeg-audio-only
  )
  run ${SCRIPTS[@]}
}

main() {
  # verify Emscripten version
  emcc -v
  if [[ "$@" == "" ]]; then
    run-all
  else
    run "$@"
  fi
}

main "$@"
