#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --disable-everything
  --disable-network
  --disable-autodetect
  --enable-small
  --enable-decoder=pcm_s16le,pcm_s24le,pcm_f32le,pcm_u8,pcm_s16be,pcm_s32be,pcm_mulaw,mp3*,flac,opus,vorbis
  --enable-encoder=pcm_s16le,pcm_s24le,pcm_f32le,pcm_u8,pcm_s16be,pcm_s32be,pcm_mulaw,libmp3lame,flac,opus,vorbis
  --enable-demuxer=pcm_s16le,pcm_s24le,pcm_f32le,pcm_u8,pcm_s16be,pcm_s32be,pcm_mulaw,wav,mp3,flac,opus,ogg,caf
  --enable-muxer=pcm_s16le,pcm_s24le,pcm_f32le,pcm_u8,pcm_s16be,pcm_s32be,pcm_mulaw,wav,mp3,flac,opus,caf
  --enable-parser=mpegaudio,opus
  --enable-filter=aresample,afilter,anull,atrim,aformat,acopy
  --enable-protocol=file
  --enable-libmp3lame     # enable libmp3lame
  --enable-libvorbis      # enable libvorbis
  --enable-libopus        # enable opus
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
emconfigure ./configure "${FLAGS[@]}"
