#!/bin/bash

# Define the output directory (Windows path accessed via WSL)
OUTPUT_DIR="/mnt/c/youtube-dl"

# Create the output directory if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
    echo "Output directory not found. Creating $OUTPUT_DIR..."
    mkdir -p "$OUTPUT_DIR"
fi

# Prompt the user for the YouTube URL
read -p "Enter the YouTube URL: " VIDEO_URL

# Exit if no URL was provided
if [ -z "$VIDEO_URL" ]; then
    echo "No URL provided. Exiting."
    exit 1
fi

# Prompt for output type: Video or Audio
echo "Select output type:"
echo "1) Video (default)"
echo "2) Audio (MP3)"
read -p "Enter choice (1 or 2): " OUTPUT_CHOICE

if [ "$OUTPUT_CHOICE" = "2" ]; then
    echo "Downloading audio and converting to MP3..."
    yt-dlp -x --audio-format mp3 -o "$OUTPUT_DIR/%(title)s.%(ext)s" "$VIDEO_URL"
else
    # For video output, offer file type choices.
    echo "Select video file type:"
    echo "1) Best available (no conversion)"
    echo "2) MP4"
    echo "3) MKV"
    echo "4) WEBM"
    read -p "Enter choice (1, 2, 3, or 4): " VIDEO_TYPE_CHOICE

    case "$VIDEO_TYPE_CHOICE" in
        2)
            echo "Downloading video and converting to MP4..."
            yt-dlp --recode-video mp4 -o "$OUTPUT_DIR/%(title)s.%(ext)s" "$VIDEO_URL"
            ;;
        3)
            echo "Downloading video and converting to MKV..."
            yt-dlp --recode-video mkv -o "$OUTPUT_DIR/%(title)s.%(ext)s" "$VIDEO_URL"
            ;;
        4)
            echo "Downloading video and converting to WEBM..."
            yt-dlp --recode-video webm -o "$OUTPUT_DIR/%(title)s.%(ext)s" "$VIDEO_URL"
            ;;
        *)
            echo "Downloading video without conversion..."
            yt-dlp -o "$OUTPUT_DIR/%(title)s.%(ext)s" "$VIDEO_URL"
            ;;
    esac
fi

echo "Download complete. Files saved to $OUTPUT_DIR."
