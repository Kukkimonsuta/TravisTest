#!/bin/bash

# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
# echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
# sudo apt-get update -qq
# sudo apt-get install mono-complete -qq

curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh

# dnvm install `grep -oP '(?<=")1.0.0[0-9a-zA-Z\.\-]*(?=")' global.json` -r mono
dnvm install `grep -oP '(?<=")1.0.0[0-9a-zA-Z\.\-]*(?=")' global.json` -r coreclr -alias default -u