# Case Study: 60 Min Video → 100 MB

## Overview

This case demonstrates a full encoding workflow focused on extreme compression:

- Input: 1080p WEBRip (HEVC)
- Output: 576x320 (AVC)
- Target size: ~100 MB
- Duration: ~60 minutes

---

## System and Environment

- OS: Windows 10 x64
- CPU: Intel i5-6300U (4 cores)
- RAM: 32 GB
- AviSynth: 3.7.5
- Encoding Tool: XviD4PSP 5 (2015)
- Codec: x264 (veryslow preset)

---

## Encoding Goals

- Minimal file size (~100 MB/hour)
- Maximum compatibility (x264 + AAC)
- Acceptable quality for archival use
- Low decoding requirements

---

## Processing Pipeline

### Video

- Source decoding
- Denoising (RemoveGrain, FluxSmooth)
- Resize 1920x1080 → 576x320
- Subtitle overlay
- Framerate adjustment (23.976 → 25)

---

## Full Encoding Workflow

### 1. Source Preparation
- Input video loaded (1080p HEVC)
- Audio extracted or loaded separately
- Subtitle file prepared (SRT)

---

### 2. AviSynth Processing
- Video decoded (DirectShowSource2)
- Audio loaded (FFAudioSource)
- Combined using AudioDub

---

### 3. Audio Processing
- Converted to Dolby Pro Logic
- Audio normalized (~+7 dB)
- Resampled to 48 kHz

---

### 4. Video Filtering
- RemoveGrain applied (denoising)
- FluxSmooth used for temporal smoothing
- Memory limit set
- Multi-threading via Prefetch

---

### 5. Resize and Timing
- Crop applied
- Resized to 576x320 (Spline36)
- Frame rate converted (23.976 → 25)

---

### 6. Audio Encoding
- Temporary WAV created
- Encoded with Nero AAC:
  - HE-AAC v2
  - ~48 kbps
  - 2-pass mode

---

### 7. Video Encoding
- x264 used with:
  - ~183 kbps bitrate
  - veryslow preset
  - multi-pass encoding
- Optimized for low bitrate efficiency

---

### 8. Muxing
- Video and audio merged (MKV)
- No unnecessary metadata
- Minimal overhead container

---

### 9. Final Output
- Size: ~100 MB
- Duration: ~60 minutes
- Fully playable on low-end hardware
``
