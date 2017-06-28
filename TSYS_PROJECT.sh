#! /bin/bash
export OS_USERNAME=daniil.pintjuk@cern.ch
export OS_TENANT_NAME=OTC-EU-DE-00000000001000020005
export OS_AUTH_URL=https://ecs.eu-de.otc.t-systems.com/v3

# With Keystone you pass the keystone password.
echo "Please enter your OpenStack Password: "
read -sr OS_PASSWORD_INPUT
export OS_PASSWORD=$OS_PASSWORD_INPUT
bash
