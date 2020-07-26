SOURCE="https://files.renoise.com/demo/Renoise_3_2_2_Demo_Linux.tar.gz"
DESTINATION="build.tar.gz"
OUTPUT="Renoise-Demo.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)
	
	tar -zxvf $(DESTINATION)
	rm -rf AppDir/opt
	
	mkdir --parents AppDir/opt/application
	cp -r Renoise_3_2_1_Demo_Linux/* AppDir/opt/application
	rm -rf AppDir/opt/application/Installer
	rm -rf AppDir/opt/application/install.sh	
	rm -rf AppDir/opt/application/uninstall.sh	
	rm -rf AppDir/opt/application/*.desktop
	rm -rf AppDir/opt/application/*.pdf

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf Renoise_3_2_1_Demo_Linux
	rm -rf AppDir/opt
