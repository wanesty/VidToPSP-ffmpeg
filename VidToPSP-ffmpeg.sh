#!/bin/sh
# Convert videos to PSP redable format

# Display usage if no parameters given
if [[ -z "$@" ]]; then
  echo " ${0##*/} <d*> <video(s)> - Convert videos to PSP (d to use directory)"
  exit
fi

# Check if selection(s) exists
for vid in "$@"; do
  if [ ! -f "$vid" ]; then
    echo " Selection \""$vid"\" does not exist."
    exit
  fi
done

for vid in "$@"; do
  vid_out="${vid/:/-}"            # ffmpeg not allowing outputs of ':', '?'
  vid_out="${vid_out%.*}"PSP # Append '-PSP' to filename
  thm_out="${vid_out%.*}".thm

  # Encode video
	ffmpeg -i file:"$vid" \
	-c:v libx264 -s 720x480 -cq 18 \
	-x264-params me=-x264-params:me=rc-lookahead=10:bframes=16:b-pyramid=none:weightp=0:me=umh:subme=11:8x8dct=0 \
	-c:a aac -b:a 160k -ar 48000 -ac 2 \
	-f psp -strict -2 \
	file:"$vid_out".mp4
  # Create thumbnail
  ffmpeg -i file:"$vid" -f image2 -ss 50 -frames 1 -s 160x120 "$thm_out"
done