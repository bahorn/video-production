#!/bin/sh
input=$1

start=$2
end=$3

# What we need to crop from the side
x_start=240
y_start=135

t=`basename "$input"`
output="staging/${t%%.*}.mkv"

ffmpeg -i "$input" -vf "crop=w=in_w-$x_start:h=in_h-$y_start:x=$x_start:y=0,scale=1920x1080,setsar=1:1" -c:v h264_nvenc -c:a aac -async 1 -ss "$start" -to "$end" "$output"
