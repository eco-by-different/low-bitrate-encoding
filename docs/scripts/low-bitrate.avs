# ============================================================
# Low Bitrate Encoding Script (~100 MB per hour)
# ============================================================

# ---------- INPUT ----------
video = DirectShowSource("input.mkv", fps=23.976)

# Audio (external or demuxed)
audio = FFAudioSource("audio.ac3")

AudioDub(video, audio)

# ---------- AUDIO PREPROCESSING ----------
ConvertToDolbyProLogic()
AmplifydB(7.0)

# ---------- FORMAT ----------
ConvertToYV12()

# ---------- FILTERING ----------
# Low bitrate optimization requires denoising

LoadPlugin("RgTools.dll")
LoadPlugin("FluxSmooth.dll")

SetMemoryMax(1536)

RemoveGrain(4)
FluxSmoothST(12,12)

Prefetch(4)

# ---------- RESIZE ----------
Crop(0, 4, -0, -0)
Spline36Resize(576, 320)

# ---------- SUBTITLES ----------
# Uncomment if needed
# TextSub("subs.srt")

# ---------- TIMING ----------
AssumeFPS(25.000, true)

# ---------- AUDIO RESAMPLE ----------
ResampleAudio(48000)

# ============================================================
# NOTES:
# - Designed for x264 ~180 kbps
# - Intended output: ~100 MB / 60 min
# - Optimized for compatibility + low CPU playback
# ============================================================
