#!/bin/bash

# Setup a password
x11vnc -storepasswd 1234 ~/.vnc/passwd

# Autostart firefox (might not be the best way to do it, but it does the trick)
echo "firefox" >> /.bashrc
