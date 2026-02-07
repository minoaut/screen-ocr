# Screen OCR

A lightweight, full-screen OCR tool for capturing and extracting text from screen regions using Tesseract.

## Features

- Select rectangular screen region
- Clipboard copy of OCR results
- Language selection
- Real-time preview with configurable preprocessing (sidebar on the right)
- Dark theme
- Configurable via `~/.config/screen_ocr/config.json`
- Linux-only currently 

## Dependencies

Install dependencies on Debian/Ubuntu:
```bash
sudo apt-get install python3-tk python3-pil python3-numpy tesseract-ocr imagemagick xclip
```

Then choose one or more tesseract language packages, for example
```bash
sudo apt-get install tesseract-ocr-eng tesseract-ocr-jpn
```

## Running

Run directly
```bash
./screen_ocr
```

Or install system-wide (creates `/usr/local/bin/screen_ocr` and a desktop file)
```bash
sudo make install
screen-ocr
```

## Usage

1. Click and drag to select a region.
2. Press `Esc` or right-click anywhere to exit.
3. A dialog pops up with the result and the result is copied to clipboard
4. Press the Exit button or right-click the background to exit

If there is no result or it produces gibberish, try:
- Inverting the image
- Scaling the image down (especially for large text)

Updated results appear after each change and are copied to clipboard. Exit anytime.


## Configuration

Configuration, mostly preprocessing options, is saved to `~/.config/screen_ocr/config.json`


## License

MIT License.
