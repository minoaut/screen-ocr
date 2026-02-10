# Screen OCR

A lightweight, full-screen OCR tool for capturing and extracting text from screen regions using Tesseract.

<video src="https://github.com/user-attachments/assets/c49c7ba6-acbe-47a2-b9e3-c64780d06e21"></video>


## Features

- Select rectangular screen region
- Copy results to clipboard
- Preprocessing options in the sidebar, e.g. equalize background, adjust levels, binarization
- Language selection
- Real-time preview
- Dark theme
- Linux-only currently 

## Dependencies

Install dependencies on Debian/Ubuntu:
```bash
sudo apt-get install python3-tk python3-pil.imagetk python3-numpy tesseract-ocr imagemagick xclip grim wl-clipboard 
```

Then choose one or more tesseract language packages, for example
```bash
sudo apt-get install tesseract-ocr-eng tesseract-ocr-jpn
```

## Running

Run directly, without installation:
```bash
./screen-ocr
```

Or install system-wide (default prefix `/usr/local`):
```bash
sudo make install
```

Or at a custom location (e.g., `/usr`):
```bash
sudo make install PREFIX=/usr
```

Once installed, run
```bash
screen-ocr
```
Or launch `screen-ocr.desktop` from your desktop environment’s application menu or launcher.


## Usage

1. Click and drag to select a region.
2. Press `Esc` or right-click anywhere to exit.
3. A dialog pops up with the result.
4. Press **Copy & Exit** to copy the result to clipboard and exit, or press **Cancel** to discard and exit.

If there is no result or it produces gibberish, try the options in the sidebar (hit the right screen edge):

- Pick a matching language, or multi-language preset
- Invert the image
- Scale the image down (especially for large text)

Updated results appear after each change. Exit anytime.


## Why preprocessing?

Tesseract works best on clean, high-contrast text of a certain size. Real-world screenshots often need cleanup - this utility gives you the tools to do it interactively, without exporting or manual editing.


## Configuration

Configuration, mostly preprocessing options, is saved to `~/.config/screen-ocr/config.json`


## Credits

This tool uses [Tesseract OCR](https://github.com/tesseract-ocr/tesseract).


## License

MIT License.

Demo video: CC0 (overlay of public domain images)

