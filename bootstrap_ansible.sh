#!/bin/bash

yum upgrade -y
yum install -y epel-release
yum install -y python python-pip python-devel openssl-devel
pip install pip --upgrade
pip install ansible

