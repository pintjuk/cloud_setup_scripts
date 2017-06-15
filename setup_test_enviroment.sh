#! /bin/bash
echo "yes | sudo yum install git"
yes | sudo yum install git
echo "git clone https://github.com/pintjuk/cloud_setup_scripts.git"
git clone https://github.com/pintjuk/cloud_setup_scripts.git
cd cloud_setup_scripts
sudo su
echo "yum install gcc-c++.x86_64"
yum install gcc-c++.x86_64
echo "yum install  wget"
yum install  wget
echo "yum install  redhat-lsb-core"
yum install  redhat-lsb-core
echo "yum install python"
yum install python
echo "yum install python-pip"
yum install python-pip
echo "yum install make"
yum install make
echo "export LC_ALL='en_US'"
export LC_ALL="en_US"
echo "pip install stomp.py"
pip install stomp.py
echo "pip install SOAPpy"
pip install SOAPpy
#cernvm
# already installed and proerly configured in the SL6 image
# yum install cvmfs cvmfs-config-default
# cvmfs_config setup
cd cloud-benchmark-suite
echo "building benchmarks"
make all
echo "runing benchmarks"
../testrun
