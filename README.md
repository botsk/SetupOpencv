# SetupOpencv

Installing opencv :

git clone https://github.com/botsk/SetupOpencv.git

cd SetupOpencv

sudo sh InstallOpencv.sh

How to Compile :

#Default way

g++ filename.cpp `pkg-config --cflags --libs opencv`

#Using script

cv filename.cpp
