# Quanergy LIDAR SDK setup
sudo apt install -y git cmake g++ libboost-all-dev libpcl-dev
mkdir -p /sdks/Quanergy
cd /sdks/Quanergy
git clone https://github.com/privvyledge/quanergy_client.git -b feature/ros2
cd  quanergy_client
mkdir build
cd build
cmake ..
make -j4
sudo make install
#
## Quanergy ROS setup
#cd ~/ros2/src
#git clone https://github.com/privvyledge/quanergy_client_ros.git -b feature/ros2
#colcon build --symlink-install --packages-select quanergy_client_ros

# ros2 launch quanergy_client_ros client.launch.py host:=<hostname_or_ip>
# ros2 run quanergy_client_ros client_node --help