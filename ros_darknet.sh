cd
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
sudo apt update
# install if ROS, rqt, rviz, robot-generic libraries, 2D/3D simulators and 2D/3D perception needed
sudo apt install ros-melodic-desktop-full
# install if ROS, rqt, rviz, and robot-generic libraries
sudo apt install ros-melodic-desktop
# install if ROS package, build, and communication libraries. No GUI tools. use this for kiara
sudo apt install ros-melodic-ros-base

echo "export PATH=/usr/local/cuda-10.2/bin\${PATH:+:\${PATH}}" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}" >> ~/.bashrc

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
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
# if there is problem with opencv please visit here
# https://answers.ros.org/question/347754/jetson-nano-comes-with-opencv-411-do-i-need-to-downgrade-to-32-for-melodic/
