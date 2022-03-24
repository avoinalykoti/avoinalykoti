#!/bin/sh 
set -eu
ansible-galaxy install -r requirements.yaml
ansible-playbook raspi-install-playbook.yaml -i hosts.yaml -K