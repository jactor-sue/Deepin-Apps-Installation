#/bin/sh
sudo apt-get install lib32z1 lib32ncurses5 p7zip p7zip-full libp11-kit0:i386 libxt6:i386 ocl-icd-libopencl1:i386 odbcinst:i386 odbcinst1debian2:i386 p11-kit-modules:i386 unixodbc:i386 libp11-kit-gnome-keyring:i386
sudo dpkg -i libs/*.deb
sudo dpkg -i deepin-wine/*.deb
sudo rm -rf /usr/share/doc/libpng16-16/changelog.Debian.gz
sudo rm -rf /usr/share/doc/libreadline7/changelog.Debian.gz
sudo apt-get install -f
sudo ldconfig
echo "安装QQ:"
echo "sudo dpkg -i deepin-apps/deepin.com.qq.im_*.deb"
echo "=================================="
echo "安装 TIM:"
echo "sudo dpkg -i deepin-apps/deepin.com.qq.office_*.deb"
echo "=================================="
echo "安装旺旺："
echo "sudo dpkg -i deepin-apps/deepin.com.taobao.wangwang_*.deb"
echo "=================================="
echo "安装微信："
echo "sudo dpkg -i deepin-apps/deepin.com.wechat_*.deb"
