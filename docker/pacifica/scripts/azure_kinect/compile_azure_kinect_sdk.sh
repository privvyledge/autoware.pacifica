# See (https://github.com/wmcelderry/azure_kinect_sdk_scripts/blob/master/prepare_sdk.sh)
###################################### Install Azure Kinect SDK from source
# Install dependencies
arch=amd64
sudo apt install -y gcc-aarch64-linux-gnu     g++-aarch64-linux-gnu     file     dpkg-dev     qemu     binfmt-support     qemu-user-static     pkg-config     ninja-build     doxygen     clang     python3     gcc     g++     git     git-lfs     nasm     cmake freeglut3-dev  libgl1-mesa-dev:$arch     libsoundio-dev:$arch     libjpeg-dev:$arch     libvulkan-dev:$arch     libx11-dev:$arch     libxcursor-dev:$arch     libxinerama-dev:$arch     libxrandr-dev:$arch     libusb-1.0-0-dev:$arch     libssl-dev:$arch     libudev-dev:$arch     mesa-common-dev:$arch     uuid-dev:$arch      pkg-config     ninja-build     doxygen     clang     gcc-multilib     g++-multilib     python3     nas zip unzip
#sudo apt install -y gcc-aarch64-linux-gnu     g++-aarch64-linux-gnu

# Clone the repository
cd /sdks/ && git clone --recursive https://github.com/microsoft/Azure-Kinect-Sensor-SDK.git -b release/1.3.x
cd Azure-Kinect-Sensor-SDK && wget https://www.nuget.org/api/v2/package/Microsoft.Azure.Kinect.Sensor/1.3.0 -O microsoft.azure.kinect.sensor.1.3.0.zip
unzip -d microsoft.azure.kinect.sensor.1.3.0 microsoft.azure.kinect.sensor.1.3.0.zip && rm microsoft.azure.kinect.sensor.1.3.0.zip
mkdir lib && cp microsoft.azure.kinect.sensor.1.3.0/linux/lib/native/x64/release/libdepthengine.so* lib/ && chmod a+rwx -R lib/ && rm -rf microsoft.azure.kinect.sensor.1.3.0/
mkdir -p build/bin && cd build && cp ../lib/libdepthengine.so* bin/
#sudo cmake .. && sudo make -j4 && sudo make install
sudo cmake .. && sudo cmake --build .
#sudo cmake .. -GNinja && sudo ninja && sudo ninja install
#sudo cmake .. && cmake --build . --config Release
#sudo cmake .. && cmake --build . --target install --config Release

#See: https://github.com/microsoft/Azure-Kinect-Sensor-SDK/blob/develop/docs/depthengine.md#linux
#Hosted on this server: https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/
DEPTH_ENGINE_PACKAGE_URL="https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4a1.4/libk4a1.4_1.4.1_amd64.deb"

############## Test
k4aviewer

simple_3d_viewer