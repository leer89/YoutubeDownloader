# YouTube Downloader Script for Windows (WSL)

This repository contains a Bash script that uses **yt-dlp** to download YouTube videos or extract audio, with options for file type conversion. The script is designed to be run on Windows using the Windows Subsystem for Linux (WSL).

## Features

- **Video Download:** Download the best available video.
- **Audio Extraction:** Extract audio and convert it to MP3.
- **File Type Options:** For video downloads, choose to convert the file to MP4, MKV, or WEBM formats.
- **Windows Integration:** Files are saved to a Windows directory (default: `C:\youtube-dl`).

## Prerequisites

### Windows Setup

1. **Install Windows Subsystem for Linux (WSL):**

   Open PowerShell as an administrator and run:
   ```powershell
   wsl --install
After installation, restart your computer. By default, Ubuntu will be installed.

Launch WSL:

Open your installed Linux distribution (e.g., Ubuntu) from the Start Menu or run:

bash
Copy
wsl
in a Command Prompt or PowerShell window.

Software Dependencies in WSL
yt-dlp: A fork of youtube-dl that is actively maintained.
ffmpeg: Required for file format conversion.
Install yt-dlp
You can install yt-dlp via pip or by downloading the binary.

Using pip:

bash
Copy
sudo apt update
sudo apt install python3-pip
pip3 install -U yt-dlp
Using the binary:

bash
Copy
sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
Install ffmpeg
Install ffmpeg with:

bash
Copy
sudo apt update
sudo apt install ffmpeg
Script Installation and Usage
Clone or Download this Repository:

Clone the repository using Git:

bash
Copy
git clone https://github.com/YourUsername/YourRepositoryName.git
cd YourRepositoryName
Make the Script Executable:

In your WSL terminal, run:

bash
Copy
chmod +x yd.sh
Run the Script:

Execute the script:

bash
Copy
./yd.sh
The script will prompt you for:

The YouTube URL.
Whether you want to download video or extract audio.
(For video) Which file format you’d like to use (e.g., MP4, MKV, or WEBM).
Output Location:

Downloads will be saved to C:\youtube-dl on your Windows system. In WSL, this folder is accessed as:

bash
Copy
/mnt/c/youtube-dl
Troubleshooting
Script Not Executing:
If you see errors like cannot execute: required file not found, ensure:

The file has Unix line endings. If you edited it on Windows, convert it using:
bash
Copy
dos2unix yd.sh
The script is executable:
bash
Copy
chmod +x yd.sh
ffmpeg Warning:
If you receive a warning about ffmpeg not being found, verify that ffmpeg is installed in WSL.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Contributing
Feel free to open issues or submit pull requests if you have suggestions or improvements.

