# Youtube Album Downloader

A PowerShell script to download a Youtube video containing multiple songs separated with timestamp chapter markers, normalize the audio levels between all the songs, and convert to MP3.

Usage:

```
.\YTADL.ps1 <OUTPUT FOLDER> <YOUTUBE URL>
```

## Requirements

```
pip install -r requirements.txt
```

Alternatively, make sure the following packages are installed:
```
ffmpeg
yt-dlp
ffmpeg-normalize
```
