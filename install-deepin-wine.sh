#!/bin/bash
echo "updating cache"
sudo apt update -y

echo "installing libs..."
sudo dpkg -i --force-overwrite ./libs/*.deb
sudo apt  install -fy -o Dpkg::Options::="--force-overwrite"

echo "installing deepin-wine..."
sudo dpkg -i --force-overwrite ./deepin-wine/*.deb
sudo apt  install -fy -o Dpkg::Options::="--force-overwrite"
sudo apt autoremove -y

echo "done."
