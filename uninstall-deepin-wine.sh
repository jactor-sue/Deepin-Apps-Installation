#!/bin/bash
echo "uninstalling deepin-wine"
sudo dpkg -P deepin-*
sudo apt install -fy
sudo apt autoremove
echo "done."