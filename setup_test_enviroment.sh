#! /bin/bash
yes | sudo yum install git
git clone ssh://git@gitlab.cern.ch:7999/dpintjuk/HNSciCloudTesting.git
cd HNsciCloudTesting

echo '[gitlab.cern.ch]:7999,[188.184.66.88]:7999 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBswtRsTLbTluK4lN2gk71Wp020NxNZcihjhUfUoJ7+hrHamzX5wjZBjwEBtgyzISYrstd1giRrP5qfqIf+dUyY=' >>  ~/.ssh/known_hosts 
git clone ssh://git@gitlab.cern.ch:7999/dpintjuk/HNSciCloudTesting.git

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
