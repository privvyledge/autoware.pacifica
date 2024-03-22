sudo apt install -y ros-${ROS_DISTRO}-joy ros-${ROS_DISTRO}-can-msgs

# Install Kvaser interface
sudo apt install -y software-properties-common
sudo apt-add-repository -y ppa:astuff/kvaser-linux
sudo apt update
sudo apt install -y kvaser-canlib-dev kvaser-drivers-dkms kvaser-linlib-dev

sudo apt install apt-transport-https
sudo sh -c 'echo "deb [trusted=yes] https://s3.amazonaws.com/autonomoustuff-repo/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/autonomoustuff-public.list'
sudo apt update
sudo apt install ros-${ROS_DISTRO}-kvaser-interface

#cd /f1tenth_ws/src
#git clone https://github.com/astuff/kvaser_interface.git -b ros2_master

#git clone https://github.com/privvyledge/raptor-dbw-ros2.git
#colcon build --symlink-install --packages-up-to raptor-dbw-can