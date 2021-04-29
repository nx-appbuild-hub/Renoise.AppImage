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


all:
	mkdir --parents $(PWD)/build/Boilerplate.AppDir
	wget --output-document=$(PWD)/build/build.tar.gz https://files.renoise.com/demo/Renoise_3_3_2_Demo_Linux.tar.gz
	
	tar -zxvf $(PWD)/build/build.tar.gz -C $(PWD)/build

	cp --recursive --force $(PWD)/build/Renoise_*_Demo_Linux/* $(PWD)/build/Boilerplate.AppDir
	rm --recursive --force $(PWD)/build/Boilerplate.AppDir/Installer
	rm --recursive --force $(PWD)/build/Boilerplate.AppDir/install.sh	
	rm --recursive --force $(PWD)/build/Boilerplate.AppDir/uninstall.sh	
	rm --recursive --force $(PWD)/build/Boilerplate.AppDir/*.desktop
	rm --recursive --force $(PWD)/build/Boilerplate.AppDir/*.pdf

	cp --force $(PWD)/AppDir/*.svg 		$(PWD)/build/Boilerplate.AppDir		|| true
	cp --force $(PWD)/AppDir/*.png 		$(PWD)/build/Boilerplate.AppDir		|| true
	cp --force $(PWD)/AppDir/*.xpm 		$(PWD)/build/Boilerplate.AppDir		|| true	
	cp --force $(PWD)/AppDir/*.desktop 	$(PWD)/build/Boilerplate.AppDir
	cp --force $(PWD)/AppDir/AppRun 	$(PWD)/build/Boilerplate.AppDir

	chmod +x $(PWD)/build/Boilerplate.AppDir/AppRun
	chmod +x $(PWD)/build/Boilerplate.AppDir/renoise

	export ARCH=x86_64 && bin/appimagetool.AppImage $(PWD)/build/Boilerplate.AppDir $(PWD)/Renoise-Demo.AppImage

clean:
	rm -rf $(PWD)/build
