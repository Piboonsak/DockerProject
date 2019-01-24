#!/bin/bash
# Install Ubuntu GUI
# Also remember you have to open port 3389 to your destination.
 
sudo apt-get install -y xubuntu-desktop

sudo apt-get install xrdp

echo xfce4-session >~/.xsession

echo "connect by client best resolution."
