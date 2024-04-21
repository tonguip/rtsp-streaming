@echo off
setlocal

set webcam_index=Gera Solo
set rtsp_url=rtsp://localhost:8554/ACCS

set ffmpeg_path=./ffmpeg-latest/bin/ffmpeg.exe

@REM Start FFmpeg for webcam streaming
"%ffmpeg_path%" -rtbufsize 1500M -f dshow -i video="%webcam_index%" -pix_fmt yuyv422 -s 1920x1080 -r 30 -c:v libx264 -preset ultrafast -tune zerolatency -b:v 5M -f rtsp -rtsp_transport udp -muxdelay 0.1 %rtsp_url%

endlocal
