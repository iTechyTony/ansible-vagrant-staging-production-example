---
# configuration for production

env: production
hostname: app
app_fqdn: app.com
ansible_ssh_user: ubuntu
ansible_ssh_private_key_file: "{{ lookup('env', 'PWD') }}/server.pem"
