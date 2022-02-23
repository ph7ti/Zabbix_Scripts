#!/bin/bash
#Instalação Zabbix Agent2 (Zabbix 5.0 LTS)

release=$(lsb_release -a | grep Release)
version=$(echo $release | awk -F' ' '{print $2}')
if [[ ($version == '20.04') ]]; then 
#Ubuntu 20.04
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix/zabbix-agent2_5.0.19-1%2Bfocal_amd64.deb
else
#Ubuntu 18.04
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix/zabbix-agent2_5.0.19-1%2Bbionic_amd64.deb
fi
dpkg -i zabbix-agent2_5.0.19-1*

#######################
#!!!!!!! Alterar os parâmetros do arquivo /etc/zabbix/zabbix_agent2.conf  !!!!!!!#
nano /etc/zabbix/zabbix_agent2.conf
#Server=IP_DO_SERVIDOR/PROXY
#ServerActive=IP_DO_SERVIDOR/PROXY
#Hostname=NOME_DO_SERVIDOR/VM ($hostname)

systemctl enable zabbix-agent2
service zabbix-agent2 start
