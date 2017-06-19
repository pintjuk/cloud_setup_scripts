#! /bin/bash
export OS_USERNAME=dpintjuk
export OS_TENANT_NAME="Personal dpintjuk"
export OS_AUTH_URL=https://keystone.cern.ch/main/v3 

# With Keystone you pass the keystone password.
echo "Please enter your OpenStack Password: "
read -sr OS_PASSWORD_INPUT
export OS_PASSWORD=$OS_PASSWORD_INPUT
bash
