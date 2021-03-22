cd
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
sudo apt update
sudo apt install ros-melodic-desktop-full
echo "export PATH=$PATH:/usr/local/cuda-10.2/bin" >> ~/.bashrc"
echo "export CUDADIR=/usr/local/cuda-10.2" >> ~/.bashrc"
echo "export LD_LIBRARY_PATH=$LD_LIBRARY:/usr/local/cuda-10.2/lib64" >> ~/.bashrc"
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc"
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc"
source ~/.bashrc
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt install python-rosdep
cd
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make
cd
sudo apt-get install build-essential git libopencv-dev
git clone https://github.com/AlexeyAB/darknet.git
git clone https://github.com/robro-ayush/darknet-makefile
cp darknet-makefile/Makefile darknet/
cd darknet
make
sudo cp libdarknet.so /usr/local/lib/
sudo cp include/darknet.h /usr/local/include/
sudo ldconfig
sudo apt-get install cmake build-essential libtclap-dev libmagic-dev libopencv-dev
cd
git clone https://github.com/stephanecharette/DarkHelp.git
cd DarkHelp
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
make package
sudo dpkg -i darkhelp-*.deb
#clone robro-cloud cosmetic-counting robro-socket
