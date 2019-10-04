<h1 align="center">
  <img src=".github/logo.png" alt="Indicator EmojiTwo" />
  <br />
  Indicator EmojiTwo
</h1>

<p align="center"><b>A very simple emoji picker.</b></p>
<div align="center"><img src=".github/screenshot.png" alt="Indicator EmojiTwo Screenshot" /></div>
<p align="center">Made with 💝 for <img src="https://raw.githubusercontent.com/anythingcodes/slack-emoji-for-techies/gh-pages/emoji/tux.png" align="top" width="24" /></p>

## Introduction

Indicator EmojiTwo is a simple emoji picker for Linux desktop environments
and uses emoji data from the [EmojiTwo](https://emojitwo.github.io/) project.
To use the picker, choose your emoji from the dropdown menu and paste it where
you want using <kbd>Ctrl</kbd> + <kbd>v</kbd>. You can also search for emojis
by keyword.

The project was forked from [emojione-picker-ubuntu](https://github.com/gentakojima/emojione-picker-ubuntu)
by [Jorge Suárez de Lis](https://github.com/gentakojima) and migrated to
Python 3.x.

### Make it faster

The indicator takes a few seconds to load, but it can take many seconds on
older computers. In *Settings*, enable the option *Low end computer mode*
to reduce the number of emojis and categories which should speed up loading
time. Currently, this mode shows ~1000 of the 1839 available emojis.

## Building, Testing, and Installation

### Ubuntu

A [PPA for Indicator EmojiTwo](https://launchpad.net/~flexiondotorg/+archive/ubuntu/indicator-emojitwo) is published by [Martin Wimpress](https://github.com/flexiondotorg).

```bash
sudo add-apt-repository ppa:flexiondotorg/indicator-emojitwo
sudo apt update
sudo apt install indicator-emojitwo
```

### Source

You'll need the following dependencies:

  * `gir1.2-appindicator3-0.1`
  * `gir1.2-gdkpixbuf-2.0`
  * `gir1.2-glib-2.0`
  * `gir1.2-gtk-3.0`
  * `gir1.2-notify-0.7`
  * `gir1.2-rsvg-2.0`
  * `python3`
  * `python3-gi`
  * `python3-setproctitle`

## TODO

  - [ ] Add keybinder for activating search
  - [ ] Refactor menu generation
  - [ ] Refactor everything to reduce/remove global variables