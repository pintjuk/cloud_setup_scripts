#! /bin/bash

# configure tests here
export ITERATIONS=4
#export Benchmarks="kv;DB12;whetstone" 
export Benchmarks="kv" 
export ActivemqHost="188.185.72.19"
export ActivemqPort="61613"
export ActivemqName="admin"
export ActivemqPswd="admin"
export QueueName="testResults"


echo "yes | sudo yum install git"
yes | sudo yum install git
echo ""
echo "git clone https://github.com/pintjuk/cloud_setup_scripts.git"
git clone https://github.com/pintjuk/cloud_setup_scripts.git
cd cloud_setup_scripts
git submodule update --init
echo ""
echo "yum install gcc-c++.x86_64"
yes | yum install gcc-c++.x86_64
echo ""
echo "yum install  wget"
yes | yum install  wget
echo ""
echo "yum install  redhat-lsb-core"
yes | yum install  redhat-lsb-core
echo ""
echo "yum install python"
yes | yum install python
echo ""
echo "yum install python-pip"
yes | yum install python-pip
echo ""
echo "updgrade pip to lates version"
pip install --upgrade pip
echo ""
echo "yum install make"
yes | yum install make
echo ""
echo "export LC_ALL='en_US'"
export LC_ALL="en_US"
echo ""
echo "pip install stomp.py"
pip install stomp.py
echo ""
echo "pip install SOAPpy"
pip install SOAPpy
#cernvm
# already installed and proerly configured in the SL6 image
# yum install cvmfs cvmfs-config-default
# cvmfs_config setup
cd cloud-benchmark-suite
echo "did the submodule get downlroaded?"
ls
echo ""
echo "building benchmarks"
make all
echo ""
echo "runing benchmarks"
../testrun
