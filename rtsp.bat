@echo off
setlocal

set webcam_index=Web Camera
set rtsp_url=rtsp://localhost:8554/ACCS

set ffmpeg_path=./ffmpeg-latest/bin/ffmpeg.exe

@REM Start FFmpeg for webcam streaming
"%ffmpeg_path%" -f dshow -i video="%webcam_index%" -video_size 1920x1080 -pix_fmt yuv420p -c:v libx264 -preset ultrafast -tune zerolatency -b:v 2M -f rtsp -rtsp_transport udp %rtsp_url%

endlocal
