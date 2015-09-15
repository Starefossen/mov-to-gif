#!/bin/bash

FFMPEG="docker-compose run --rm ffmpeg -v warning"
GIFSICLE="docker-compose run --rm gifsicle"

FILTERS="fps=fps=15,scale=728:-1:flags=bicubic"

INPUT_DIR=./input
OUTPUT_DIR=./output

function record {
  local -r IN=$1
  local -r OUT=$2
  local -r PALETTE="${OUT%.*}-palette.png"

  ${FFMPEG} \
     -i "${IN}" \
    -vf "${FILTERS},palettegen=stats_mode=diff" \
     -y "${PALETTE}"

  ${FFMPEG} \
     -i "${IN}" \
     -i "${PALETTE}" \
    -lavfi "${FILTERS} [x]; [x][1:v] paletteuse=dither=bayer:bayer_scale=3" \
     -y "${OUT}"

  ${GIFSICLE} -O3 "${OUT}" -o "${OUT}"
}

for path in ${INPUT_DIR}/*; do
  file=`basename $path`

  mov_path="${path}"
  gif_path="${OUTPUT_DIR}/${file%.*}.gif"

  if [ -f ${gif_path} ]; then
    echo "Skipping ${file}, already recorded!"
  else
    echo "${mov_path} > ${gif_path}"
    record "${mov_path}" "${gif_path}"
  fi
done

echo "Everything is done!"
