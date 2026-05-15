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
