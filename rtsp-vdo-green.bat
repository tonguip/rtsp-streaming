@echo off
setlocal

set webcam_index=USB Video
set rtsp_url=rtsp://localhost:8554/ACCS

set ffmpeg_path=./ffmpeg-latest/bin/ffmpeg.exe

@REM Start FFmpeg for webcam streaming
"%ffmpeg_path%" -f dshow -video_size 1920x1080 -framerate 30 -i video="%webcam_index%" -c:v libx264 -preset ultrafast -tune zerolatency -acodec aac -strict experimental -muxdelay 0.1 -b:v 5M -rtsp_transport udp -f rtsp %rtsp_url%

endlocal