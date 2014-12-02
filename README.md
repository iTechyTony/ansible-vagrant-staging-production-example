# ansible-vagrant-staging-production-example
> An Ansible example for devving in Vagrant with deployment support for staging and production servers.

## Setup

Install the following:

- Node ([download](https://nodejs.org/))
- VirtualBox ([download](https://www.virtualbox.org/))
- Vagrant ([download](http://www.vagrantup.com/downloads.html))
- Ansible
  - `pip install ansible` via [pip](http://pip.readthedocs.org/en/latest/installing.html) (All Platforms)
  - `brew install ansible` via [homebrew](http://brew.sh/) (OSX)
  - `apt-get/yum install ansible` (Linux)

### Development / Deployment Commands

* `vagrant up` - import base box & provision with ansible
* `ansible-playbook -i deploy/ansible/inventory/production deploy/ansible/provision.yml` - provision production servers
* `ansible-playbook -i deploy/ansible/inventory/staging deploy/ansible/provision.yml` - provision staging servers
* `ansible-playbook -i deploy/ansible/inventory/production deploy/ansible/deploy.yml` - deploy production servers
* `ansible-playbook -i deploy/ansible/inventory/staging deploy/ansible/deploy.yml` - deploy staging servers
* `vagrant ssh -c 'sudo service app restart'` - restart app service on vagrant machine
* `vagrant ssh -c 'tail -f /var/log/app' &` - watch stdout/stderr for index.js running on vagrant box
* `pgrep -f 'tail -f /var/log/app' | xargs kill` - stop watching /var/log/app

*Many of these commands will not work on Windows!*

### NPM Shortcut Commands

* `npm run configure-hosts` - point app.loc to vagrant
* `npm run dev` - open browser to appropriate url for development
* `npm run provision` - provision production servers
* `npm run provision-staging` - provision staging servers
* `npm run deploy` - deploy code to production servers
* `npm run deploy-staging` - deploy code to staging servers
* `npm run vagrant-restart-app` - restart app service on vagrant machine
* `npm run vagrant-watch-log &` - watch stdout/stderr for index.js running on vagrant box
* `npm run vagrant-unwatch-log` - stop watching /var/log/app on vagrant box

### FAQ

#### Vagrant threw an error about ssh/ansible during `vagrant up`
This happens occasionally when Ansible tries to provision the box before the network interface is initialized. Try running `vagrant provision` manually after `vagrant up` completes.
