#!/bin/bash

_INSTALL_PREFIX=/usr/local/
_AUTOSTART_DIR=/etc/xdg/autostart
_APP_DIR=/usr/local/share/applications

uninstall_indicatoremojitwo(){
	# Remove files
	rm -f $_INSTALL_PREFIX/bin/indicator-emojitwo
	rm -f $_AUTOSTART_DIR/indicator-emojitwo_autostart.desktop
	rm -rf $_INSTALL_PREFIX/share/indicator-emojitwo
    # Remove desktop entry
    rm -f $_APP_DIR/indicator-emojitwo.desktop
	# Uninstall iconsa
	for SIZE in 16 22 24 32 48 64 ; do
		xdg-icon-resource uninstall --theme ubuntu-mono-dark --size ${SIZE} indicator-emojitwo
		xdg-icon-resource uninstall --theme ubuntu-mono-light --size ${SIZE} indicator-emojitwo
		xdg-icon-resource uninstall --theme default --size ${SIZE} indicator-emojitwo
	done
}

install_indicatoremojitwo(){
	# Make directories
	mkdir -p $_INSTALL_PREFIX/bin
	mkdir -p $_AUTOSTART_DIR
	mkdir -p $_INSTALL_PREFIX/share/indicator-emojitwo
	# Copy files
	cp indicator-emojitwo $_INSTALL_PREFIX/bin
	cp indicator-emojitwo_autostart.desktop $_AUTOSTART_DIR
	cp -rf assets $_INSTALL_PREFIX/share/indicator-emojitwo/
    # Fix autostart paths
	sed -i $_AUTOSTART_DIR/indicator-emojitwo_autostart.desktop -e "s*/usr*$_INSTALL_PREFIX*g"
	# Install icons
	for SIZE in 16 22 24 32 48 64 ; do
		xdg-icon-resource install --theme ubuntu-mono-dark --size ${SIZE} assets/icon-mono-dark-${SIZE}.png indicator-emojitwo
		xdg-icon-resource install --theme ubuntu-mono-light --size ${SIZE} assets/icon-mono-light-${SIZE}.png indicator-emojitwo
		xdg-icon-resource install --theme default --size ${SIZE} assets/icon-default-${SIZE}.png indicator-emojitwo
	done
    # Install desktop entry
    mkdir -p $_APP_DIR
    cp -f indicator-emojitwo.desktop $_APP_DIR
}

cd "${0%/*}"

if [ "$(id -u)" != "0" ]; then
	echo "Since you are running this as plain user, the program will be installed just for the current user."
	_INSTALL_PREFIX=~/.local
	_AUTOSTART_DIR=~/.config/autostart
    _APP_DIR=~/.local/share/applications
else
	_INSTALL_PREFIX=/usr/local
	_AUTOSTART_DIR=/etc/xdg/autostart
    _APP_DIR=/usr/local/share/applications
fi

if [ -f "$_INSTALL_PREFIX/bin/indicator-emojitwo" ] ; then
	read -p "Installation detected. Press enter to uninstall or Ctrl-C to abort"
	uninstall_indicatoremojitwo
	echo "Uninstall completed."
else
	read -p "Press enter to install indicator-emojitwo or Ctrl-C to abort"
	install_indicatoremojitwo
	echo "Installation completed."
fi