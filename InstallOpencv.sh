
echo "\n> Installing OpenCV ...\n"

echo "> Installing Dependencies ...\n"

sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

Directory="OpenCV"
temp=""

if [ ! -d "$Directory" ]
then
	cd OpenCV
else

	it=0
	while

		temp="OpenCV_"$it
		it=$((it+1))

		[ -d "$temp" ]
	do :; done

	mkdir $temp
	cd $temp
fi	

# Check for git

GitResult=`sudo dpkg -s git | head -n 1`

if [ "$GitResult" != "Package: git" ]
then
	echo "\n\n> Installing git ...\n\n"
	sudo apt-get install -y git
fi

echo "\n> Getting OpenCV Source code from git\n"

git clone https://github.com/opencv/opencv.git

# Create Temporary Directory for generated Makefiles, Projectfiles, Object files and Binaries

cd opencv

mkdir Release
cd Release

# Check for cmake

CmakeResult=`sudo dpkg -s cmake | head -n 1`

if [ "$CmakeResult" != "Package: cmake" ]
then
	echo "\n> Installing cmake ...\n"
	sudo apt-get install -y cmake
fi

echo "\n> Compiling OpenCV Source codes using cmake ...\n"

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..

echo "\n> Building Compiled Files ...\n"

make
sudo make install

sudo ldconfig

cp cv /bin/cv