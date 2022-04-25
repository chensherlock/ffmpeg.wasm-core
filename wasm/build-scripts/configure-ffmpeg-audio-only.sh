#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --disable-everything
  --disable-network
  --disable-autodetect
  --enable-small
  --enable-decoder=pcm*,adpcm*,mp3*,flac,opus
  --enable-encoder=pcm*,adpcm*,libmp3lame,flac,opus
  --enable-demuxer=pcm*,wav,mp3,flac,opus,ogg,caf
  --enable-muxer=pcm*,wav,mp3,flac,opus,caf
  --enable-parser=mpegaudio,opus
  --enable-filter=aresample,afilter,anull,atrim,aformat,acopy
  --enable-protocol=file
  --enable-libmp3lame     # enable libmp3lame
  --enable-libvorbis      # enable libvorbis
  --enable-libopus        # enable opus
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
emconfigure ./configure "${FLAGS[@]}"
