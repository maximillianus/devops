#!/bin/bash

# Hello world
echo Starting Ubuntu setup

# Grab password from argument
if [ "$1" == "" ]
then
    userpassword=password
else
    userpassword=$1
fi

echo $userpassword

# Update apt-get
echo $userpassword | sudo -S apt update

# Ensure git is installed
echo $userpassword | sudo -S apt install git

# Ensure ansible is installed
echo $userpassword | sudo -S apt install ansible

# Clone playbooks git repository
cd
mkdir -p codes/gitrepo
cd codes/gitrepo
git clone https://github.com/maximillianus/devops.git

# Run playbook
cd ~/codes/gitrepo/devops
ansible-playbook ansible-playbook/local-playbook.yaml -e "ansible_ssh_pass=$userpassword" -vv

