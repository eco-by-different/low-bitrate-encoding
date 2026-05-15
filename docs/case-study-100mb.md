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
- Frame rate reinterpreted using AssumeFPS (23.976 → 25, no frame interpolation)

---


- Encoded using Nero AAC:
  - HE-AAC v2
  - ~48 kbps
  - 2-pass ABR mode
  - 48 kHz sample rate

- Channel processing:
  - Converted to 2-channel Dolby Pro Logic (matrix stereo)

---

### 7. Video Encoding

- Encoding performed using x264:

  - Target size: ~100 MB (size-based encoding)
  - Bitrate: ~183 kbps
  - Preset: veryslow

- Multi-pass strategy:
  - 3-pass encoding (size targeting)
  - First pass performed without "fast" optimizations (full analysis)
  - Additional pass used to refine rate control accuracy

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

---

#### Advanced Encoding Configuration (x264)

Encoding performed using a custom x264 build (x264 tmod).

---

Pass structure:

- 3-pass size-based encoding (~100 MB target)
- No fast first pass (full analysis on all passes)

---

Common parameters:

--preset veryslow  
--tune film  
--ref 8  
--aq-mode 3  
--aq-strength 0.4  
--deblock 1:1  
--psy-rd 0.00:0.00  
--qcomp 0.80  
--partitions p8x8,b8x8,i8x8,i4x4  
--rc-lookahead 150  
--open-gop  
--non-deterministic  
--aq3-mode 3  
--fgo 1  
--keyint infinite  

---

Note:

- Custom AQ3 mode used for improved low bitrate distribution
- Psy optimizations disabled (psy-rd 0.00) for cleaner compression behavior
- Infinite GOP used to maximize compression efficiency

---

Pass execution:

- 3-pass size-based encoding (~100 MB target)
- All passes use identical encoding parameters (no fast first pass)
- Only the pass index changes

---

Pass commands (simplified):

All passes share identical encoder settings.
Only the pass index changes:

Pass 1 (analysis):
--pass 1 --size 100

Pass 3 (refinement):
--pass 3 --size 100

Pass 2 (final):
--pass 2 --size 100

