# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)
DESTINATION="VLC.AppImage"

all: clean

	mkdir --parents $(PWD)/build

	apprepo --destination=$(PWD)/build appdir vlc vlc-bin vlc-data vlc-l10n vlc-plugin-access-extra vlc-plugin-base vlc-plugin-bittorrent \
												vlc-plugin-fluidsynth vlc-plugin-jack vlc-plugin-notify vlc-plugin-qt vlc-plugin-samba \
												vlc-plugin-skins2 vlc-plugin-svg vlc-plugin-video-output vlc-plugin-video-splitter vlc-plugin-visualization \
												x264 x265 libicu66 libpcre2-16-0 libmad0 libcddb2 libdc1394-22 libdc1394-25 libidn11 libdca0 \
												libdvbpsi10 libxerces-c3.2 libdvdread7 libvncserver1 libxcb1 libjpeg-turbo8 liba52-0.7.4 libvdpau-va-gl1 \
												libqt5gui5 libqt5x11extras5 libqt5svg5 


	echo "exec \$${APPDIR}/bin/vlc -vvv \$${@}" >>  $(PWD)/build/Vlc.AppDir/AppRun

	rm -f $(PWD)/build/Vlc.AppDir/*.desktop

	cp --force $(PWD)/AppDir/*.desktop $(PWD)/build/Vlc.AppDir/
	cp --force $(PWD)/AppDir/*.png $(PWD)/build/Vlc.AppDir/ || true
	cp --force $(PWD)/AppDir/*.svg $(PWD)/build/Vlc.AppDir/ || true

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/Vlc.AppDir/ $(PWD)/VLC.AppImage


clean:
	rm -rf $(PWD)/build
