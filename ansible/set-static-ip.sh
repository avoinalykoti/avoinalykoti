#!/bin/sh 
set -eu
ansible-galaxy install -r requirements.yaml
ansible-playbook raspi-set-static-ip.yaml -i hosts.yaml