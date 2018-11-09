#!/bin/bash
echo "uninstalling deepin-wine"
sudo apt purge deepin-fonts-wine deepin-wine-helper deepin-wine-plugin deepin-wine-uninstaller -y
sudo apt install -fy
sudo apt autoremove -y
echo "done."