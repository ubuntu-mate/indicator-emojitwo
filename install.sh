#!/bin/bash

_INSTALL_PREFIX=/usr/local/
_AUTOSTART_DIR=/etc/xdg/autostart

uninstall_emojionepicker(){
	# Remove files
	rm -f $_INSTALL_PREFIX/bin/emojione-picker
	rm -f $_AUTOSTART_DIR/emojione-picker_autostart.desktop
	rm -rf $_INSTALL_PREFIX/share/emojione-picker
	# Uninstall icons
	for SIZE in 16 22 24 32 48 64 ; do
		xdg-icon-resource uninstall --theme ubuntu-mono-dark --size ${SIZE} emojione-picker
		xdg-icon-resource uninstall --theme ubuntu-mono-light --size ${SIZE} emojione-picker
	done
}

install_emojionepicker(){
	# Make directories
	mkdir -p $_INSTALL_PREFIX/bin
	mkdir -p $_AUTOSTART_DIR
	mkdir -p $_INSTALL_PREFIX/share/emojione-picker
	# Copy files
	cp emojione-picker $_INSTALL_PREFIX/bin
	cp emojione-picker_autostart.desktop $_AUTOSTART_DIR
	cp -rf assets $_INSTALL_PREFIX/share/emojione-picker/
	sed -i $_AUTOSTART_DIR/emojione-picker_autostart.desktop -e "s*/usr*$_INSTALL_PREFIX*g"
	# Install icons
	for SIZE in 16 22 24 32 48 64 ; do
		xdg-icon-resource install --theme ubuntu-mono-dark --size ${SIZE} assets/icon-mono-dark-${SIZE}.png emojione-picker
		xdg-icon-resource install --theme ubuntu-mono-light --size ${SIZE} assets/icon-mono-light-${SIZE}.png emojione-picker
	done
}

if [ "$(id -u)" != "0" ]; then
	echo "Since you are running this as plain user, the program will be installed just for the current user."
	_INSTALL_PREFIX=~/.local
	_AUTOSTART_DIR=~/.config/autostart
else
	_INSTALL_PREFIX=/usr/local
	_AUTOSTART_DIR=/etc/xdg/autostart
fi

if [ -f "$_INSTALL_PREFIX/bin/emojione-picker" ] ; then
	read -p "Installation detected. Press enter to uninstall or Ctrl-C to abort"
	uninstall_emojionepicker
	echo "Uninstall completed."
else
	read -p "Press enter to install emojione-picker or Ctrl-C to abort"
	install_emojionepicker
	echo "Installation completed."
fi

