# VidToPSP-ffmpeg


*Will become:tm: a*
### Shell script to convert video to a format readable by the PSP and create a thumbnail for the PSP's video tab.
***
this script is working but i want to make it more interactive as a v1 release.

however, if the video doesn't play once on your PSP, you can try <ins>manually</ins> encoding it with :

```sh
ffmpeg -i "input file" -c:v libx264 -s "resolution*" -preset "quality" -x264-params me=-x264-params:me=rc-lookahead=10:bframes=16:b-pyramid=none:weightp=0:me=umh:subme=11:8x8dct=0 -c:a aac -b:a 160k -ar 48000 -ac 2 -f psp -strict -2 "output file".mp4
```
"*input file*" : input file, can include path, better to keep it in quotes
"*resolution*" : should be `320x240` for PSP 1001 and `480x272` for PSP 2001
"*quality*" : set as either  `veryfast` `faster` `fast` `medium` `slow` `slower` `veryslow` , trade encode time for quality
"*output file*" output file, can include path, needs to be a .mp4


```sh
ffmpeg -i "input file" -f image2 -ss 50 -frames 1 -s 160x120 "output file".thm
```
"*input file*" : input file, can include path, better to keep it in quotes
"*output file*" output file, can include path, needs to be a .thm
***

*Works on Linux and most likely MacOS

Script require **FFmpeg** installed to work

***

Fork and simplified version of [Gen2ly](https://gist.github.com/Gen2ly)'s gist "[pspvidconv](https://gist.github.com/Gen2ly/3123937)"
