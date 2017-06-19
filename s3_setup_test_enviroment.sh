#! /bin/bash

# configure tests here

export Endpoint=
export Secret=
export Access=

yum -q list installed packageX &>/dev/null && ( \
	 \
)||(\

if yum list installed "git" >/dev/null 2>&1 
then
	echo "Git Installed"
else
        echo "Installing git "
	echo "yes | sudo yum install git"
	yes | sudo yum install git 
fi

echo ""
echo "git clone https://github.com/pintjuk/cloud_setup_scripts.git"
git clone https://github.com/pintjuk/cloud_setup_scripts.git
cd cloud_setup_scripts
git submodule update --init
echo ""


if yum list installed "davix" >/dev/null 2>&1 
then
	echo "Davix Installed"
else
        echo "Installing davix "
	echo "yes | sudo yum install davix"
	yes | sudo yum install git 
fi



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

touch /tmp/.allsetup

echo "runing benchmarks"
../testrun
