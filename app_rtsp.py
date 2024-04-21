import subprocess

def start_rtsp_stream(webcam_index=0, rtsp_url="rtsp://localhost:8554/live"):
    # FFmpeg command to capture video from webcam and stream it over RTSP using UDP with RTCP
    ffmpeg_command = [
        "ffmpeg",
        "-f", "dshow",  # Input format for Windows webcam
        "-i", f"video={webcam_index}",  # Input source (change the name based on your webcam)
        "-pix_fmt", "yuv420p",  # Pixel format
        "-c:v", "libx264",  # Video codec
        "-preset", "ultrafast",  # Preset for speed
        "-tune", "zerolatency",  # Tune for zero latency
        "-b:v", "500k",  # Bitrate
        "-f", "rtsp",  # Output format for RTSP
        "-rtsp_transport", "udp",  # Use UDP for RTSP
        "-muxdelay", "0.1",  # Set a small delay to reduce buffering
        rtsp_url  # RTSP URL
    ]

    # Start FFmpeg process
    ffmpeg_process = subprocess.Popen(ffmpeg_command)

    return ffmpeg_process

if __name__ == "__main__":
    webcam_index = "Web Camera"  # Change the webcam index based on your setup
    rtsp_url = "rtsp://localhost:8554/TRML"  # RTSP URL for streaming

    ffmpeg_process = start_rtsp_stream(webcam_index, rtsp_url)

    try:
        # Do other tasks or just keep the script running
        input("Press Enter to stop the RTSP stream...\n")
    except KeyboardInterrupt:
        pass
    finally:
        # Stop the FFmpeg process when the script is interrupted
        ffmpeg_process.terminate()
