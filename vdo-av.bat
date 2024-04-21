@echo off
setlocal

set ffmpeg_path=./ffmpeg-latest/bin/ffmpeg.exe

"%ffmpeg_path%" -list_options true -f dshow -i video="Gera Solo"

endlocal