sudo apt-get update
sudo apt-get upgrade
cd
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
sudo apt update
sudo apt install ros-melodic-ros-base

echo "export PATH=/usr/local/cuda-10.2/bin\${PATH:+:\${PATH}}" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}" >> ~/.bashrc

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make
cd
source ~/.bashrc
sudo apt-get install git
git clone https://github.com/AlexeyAB/darknet.git
cd darknet
#open MakeFile
#Make "GPU: 1, OpenMP: 1, libso: 1, OpenMP: 1, CUDNN: 1, or as per system config"
make
sudo cp libdarknet.so /usr/local/lib/
sudo cp include/darknet.h /usr/local/include/
sudo ldconfig
sudo apt-get install cmake libtclap-dev libmagic-dev
cd
git clone https://github.com/stephanecharette/DarkHelp.git
cd DarkHelp
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make package
sudo dpkg -i darkhelp-*.deb

#clone robro-cloud cosmetic-counting robro-socket
# if there is problem with opencv please visit here
# https://answers.ros.org/question/347754/jetson-nano-comes-with-opencv-411-do-i-need-to-downgrade-to-32-for-melodic/
cd /usr/include/

#to link opencv4 and regular opencv
sudo ln -s opencv4 opencv
cd
#to add partial-up arrow search for easy programming / terminal commands

echo "bind '\"\e[A\": history-search-backward'" >> ~/.bashrc
echo "bind '\"\e[B\": history-search-forward'" >> ~/.bashrc

# For easy editing
sudo apt-get install vim

# For Web Plugins / and http based GUI
sudo apt-get install ros-melodic-rosbridge-server 

# For GUI Compressed Images
sudo apt-get install ros-melodic-image-transport-plugins
