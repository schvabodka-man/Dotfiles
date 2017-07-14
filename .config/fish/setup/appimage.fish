#!/usr/bin/fish
mkdir ~/bin
cd ~/bin
mkdir appimage
cd appimage
wget http://bintray.com/artifact/download/probono/AppImages/AppImageUpdate-443.g69bf471-x86_64.AppImage
chmod a+x AppImageUpdate-443.g69bf471-x86_64.AppImage
mkdir gimp
cd gimp
wget https://bintray.com/artifact/download/probono/AppImages/GIMP-2.9.3.glibc2.15-x86_64.AppImage
wget https://bintray.com/artifact/download/probono/AppImages/GIMP-2.9.3.glibc2.15-x86_64.AppImage.asc
wget https://bintray.com/artifact/download/probono/AppImages/GIMP-2.9.3.glibc2.15-x86_64.AppImage.zsync
wget https://bintray.com/artifact/download/probono/AppImages/GIMP-2.9.3.glibc2.15-x86_64.AppImage.zsync.asc
chmod a+x GIMP-2.9.3.glibc2.15-x86_64.AppImage
cd ..
mkdir calibre
cd calibre
wget https://bintray.com/artifact/download/probono/AppImages/Calibre-3.1.1.glibc2.14-x86_64.AppImage
wget https://bintray.com/artifact/download/probono/AppImages/Calibre-3.1.1.glibc2.14-x86_64.AppImage.zsync
chmod a+x Calibre-3.1.1.glibc2.14-x86_64.AppImage
cd ..
mkdir etcher
cd etcher
wget https://bintray.com/artifact/download/probono/AppImages/Etcher-1.0.0-beta.2-glibc2.14-x86_64.AppImage
wget https://bintray.com/artifact/download/probono/AppImages/Etcher-1.0.0-beta.2-glibc2.14-x86_64.AppImage.asc
wget https://bintray.com/artifact/download/probono/AppImages/Etcher-1.0.0-beta.2-glibc2.14-x86_64.AppImage.zsync
wget https://bintray.com/artifact/download/probono/AppImages/Etcher-1.0.0-beta.2-glibc2.14-x86_64.AppImage.zsync.asc
chmod a+x Etcher-1.0.0-beta.2-glibc2.14-x86_64.AppImage
