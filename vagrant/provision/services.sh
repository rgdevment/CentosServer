echo "******************************************"
echo "|  Descargando roles de Ansible-Galaxy   |"
echo "******************************************"

sudo mkdir -p /etc/ansible/roles
sudo mkdir -p /opt/logstash

roles_list[0]='geerlingguy.ntp,1.5.2'
roles_list[1]='geerlingguy.firewall,2.3.0'
roles_list[2]='geerlingguy.nodejs,4.1.2'
roles_list[3]='geerlingguy.git,1.4.0'
roles_list[4]='geerlingguy.repo-remi,1.2.0'
roles_list[5]='geerlingguy.repo-epel,1.2.2'
roles_list[6]='kbrebanov.selinux'
roles_list[7]='DavidWittman.redis,1.2.5'
roles_list[8]='MarioDevment.rabbitmq'
roles_list[9]='MarioDevment.java8'
roles_list[10]='MarioDevment.elasticsearch,1.1.5'
roles_list[11]='MarioDevment.kibana,1.1.4'
roles_list[12]='geerlingguy.logstash,3.0.1'

sudo mkdir -p /etc/ansible/roles
for role_and_version in "${roles_list[@]}"
do
    role_and_version_for_grep="${role_and_version/,/, }"

    if ! sudo ansible-galaxy list | grep -qw "$role_and_version_for_grep";
    then
            echo "Installing ${role_and_version}"
            sudo ansible-galaxy -f install $role_and_version
   else
        echo "Already installed ${role_and_version}"
    fi
done

# Execute Ansible
echo "-> Execute Ansible"
sudo ansible-playbook /ansible/services.yml -i /ansible/inventories/hosts --connection=local