###################################### Install Azure Kinect SDK from repositories
#### Links
sudo apt-get install -y build-essential cmake libgtk2.0-dev libusb-1.0 ffmpeg mlocate locate curl libcurl4-openssl-dev libssl-dev uuid-dev ca-certificates

### 1.3
sudo apt-add-repository -y -n 'deb http://archive.ubuntu.com/ubuntu focal main'
sudo apt-add-repository -y 'deb http://archive.ubuntu.com/ubuntu focal universe'
sudo apt-get install -y libsoundio1
sudo apt-add-repository -r -y -n 'deb http://archive.ubuntu.com/ubuntu focal universe'
sudo apt-add-repository -r -y 'deb http://archive.ubuntu.com/ubuntu focal main'

if ! dpkg -s libk4a1.3 > /dev/null; then
	curl -sSL https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4a1.3/libk4a1.3_1.3.0_amd64.deb > /tmp/libk4a1.3_1.3.0_amd64.deb
	echo 'libk4a1.3 libk4a1.3/accepted-eula-hash string 0f5d5c5de396e4fee4c0753a21fee0c1ed726cf0316204edda484f08cb266d76' | sudo debconf-set-selections
	sudo dpkg -i /tmp/libk4a1.3_1.3.0_amd64.deb
fi
if ! dpkg -s libk4a1.3-dev > /dev/null; then
	curl -sSL https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4a1.3-dev/libk4a1.3-dev_1.3.0_amd64.deb > /tmp/libk4a1.3-dev_1.3.0_amd64.deb
	sudo dpkg -i /tmp/libk4a1.3-dev_1.3.0_amd64.deb
fi
if ! dpkg -s libk4abt1.0 > /dev/null; then
	curl -sSL https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4abt1.0/libk4abt1.0_1.0.0_amd64.deb > /tmp/libk4abt1.0_1.0.0_amd64.deb
	echo 'libk4abt1.0	libk4abt1.0/accepted-eula-hash	string	03a13b63730639eeb6626d24fd45cf25131ee8e8e0df3f1b63f552269b176e38' | sudo debconf-set-selections
	sudo dpkg -i /tmp/libk4abt1.0_1.0.0_amd64.deb
fi
if ! dpkg -s libk4abt1.0-dev > /dev/null; then
	curl -sSL https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4abt1.0-dev/libk4abt1.0-dev_1.0.0_amd64.deb > /tmp/libk4abt1.0-dev_1.0.0_amd64.deb
	sudo dpkg -i /tmp/libk4abt1.0-dev_1.0.0_amd64.deb
fi
if ! dpkg -s k4a-tools > /dev/null; then
	curl -sSL https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/k/k4a-tools/k4a-tools_1.3.0_amd64.deb > /tmp/k4a-tools_1.3.0_amd64.deb
	sudo dpkg -i /tmp/k4a-tools_1.3.0_amd64.deb
fi


#### 1.4
## https://atlane.de/install-azure-kinect-sdk-1-4-on-ubuntu-22-04/
#
#### install libsoundio
## Note: libsoundio1 is a dependency for k4a-tools
## https://packages.ubuntu.com/focal/amd64/libsoundio1/download
#wget mirrors.kernel.org/ubuntu/pool/universe/libs/libsoundio/libsoundio1_1.1.0-1_amd64.deb
#sudo dpkg -i libsoundio1_1.1.0-1_amd64.deb
#rm libsoundio1_1.1.0-1_amd64.deb
#
##  Add Microsoft Repositories for Ubuntu 20.04 and 18.04
## Ubuntu 20.04
#curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
#sudo apt-add-repository -y https://packages.microsoft.com/ubuntu/20.04/prod
#
### Ubuntu 18.04
#curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
#sudo apt-add-repository -y https://packages.microsoft.com/ubuntu/18.04/prod
#curl -sSL https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft-prod.list
#curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
#
## Install Azure Kinect Packages
#echo 'libk4a1.4 libk4a1.4/accepted-eula-hash string 0f5d5c5de396e4fee4c0753a21fee0c1ed726cf0316204edda484f08cb266d76' | sudo debconf-set-selections
#echo 'libk4a1.4 libk4a1.4/accept-eula boolean true' | sudo debconf-set-selections
#
#sudo apt-get update
#sudo apt-get install -y libk4a1.4
#sudo apt install -y libk4a1.4-dev
#sudo apt install -y k4a-tools

########################### Setup UDEV rules to use without root access
##cd /etc/udev/rules.d/ && wget https://github.com/microsoft/Azure-Kinect-Sensor-SDK/tree/develop/scripts/99-k4a.rules
##
############### Test
##k4aviewer

## To uninstall
##sudo apt-get purge -y k4a-tools
##sudo apt-get purge -y libk4a1.4
##sudo apt-get purge -y libk4a1.4-dev