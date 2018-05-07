Multiple Virtual Machine For developers

Require:
- Vagrant 2.0+
- Plugins “vagrant-vbguest”
- VirtualBox 5.2+

### Informatión general
- For init all machines: **vagrant up**
- For external ssh: **private\_key**
**\~/CentosServer/vagrant/.vagrant/machines/web/virtualbox/private\_key**

# VM1 - Web Server Machine

It’s you need init only this machine type `vagrant up web` 

This machine contain:
- Apache 2
- MariaDB
- MongoDB
- PHP 7.2
- NTP config for Madrid (you can changed)
- Composer
- NodeJS
- GIT
- php-zip (for composer)
- Blackfire

This machine configure whit multiple virtualhost, is perfect for symfony install, laravel and other frameworks.

All virtualhost you can access from ip (192.168.50.xx) and the public folder on sites directory.

The virtualhost 192.168.50.20 incluye and demo of symfony skeleton installation, you only need run composer update.
for run test symfony on 192.168.50.20 run *composer update*.

If you need add more virtual host, you can add new ip con _Vagrantfile_ and add new virtualhost on _/ansible/templates/vhost.conf.base_

# VM2 - Services Machine

It’s you need init only this machine type `vagrant up services` 

This machine contain:
- Redis
- RabbitMQ
- ElasticSearch
- Kibana
