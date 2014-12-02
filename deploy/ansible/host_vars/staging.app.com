---
# configuration for staging server

env: staging
hostname: app-staging
app_fqdn: staging.app.com
ansible_ssh_user: ubuntu
ansible_ssh_private_key_file: "{{ lookup('env', 'PWD') }}/server.pem"
