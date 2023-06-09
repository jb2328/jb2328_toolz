#!/bin/bash
# A bash script to install libedgetpu1-std on Raspberry Pi
# https://coral.ai/docs/accelerator/get-started/#runtime-on-linux
echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | sudo tee /etc/apt/sources.list.d/coral-edgetpu.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install libedgetpu1-std
echo Coral TPU Installed!