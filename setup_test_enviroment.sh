#! /bin/bash
yes | sudo yum install git
git clone https://github.com/pintjuk/cloud_setup_scripts.git
cd cloud_setup_scripts
sudo su
yum install gcc-c++.x86_64
yum install  wget
yum install  redhat-lsb-core
yum install python
yum install python-pip
yum install make
export LC_ALL="en_US"
pip install stomp.py
pip install SOAPpy
#cernvm
# already installed and proerly configured in the SL6 image
# yum install cvmfs cvmfs-config-default
# cvmfs_config setup
cd cloud-benchmark-suite
make all
../testrun
