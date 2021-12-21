#!/bin/bash

cat > /ansible/host_vars/$IIS_SERVER.yml <<EOF
ansible_host: "{{ lookup('env','IIS_SERVER') }}"
ansible_winrm_scheme: http
ansible_port: 5985
ansible_connection: winrm
ansible_user: "{{ lookup('community.hashi_vault.hashi_vault', 'secret=iis/{{ ansible_host }}:username token=s.dwof9OUSz840O8UvnSWnGUOM url=http://10.180.12.36:8200') }}"
ansible_password: "{{ lookup('community.hashi_vault.hashi_vault', 'secret=iis/{{ ansible_host }}:password token=s.dwof9OUSz840O8UvnSWnGUOM url=http://10.180.12.36:8200') }}"
ansible_winrm_transport: ntlm
EOF

echo $IIS_SERVER > /ansible/hosts
