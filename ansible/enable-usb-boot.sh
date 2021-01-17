#!/bin/sh 
set -eu
ansible-galaxy install -r requirements.yaml
ansible-playbook raspi-enable-usb-boot.yaml -i hosts.yaml