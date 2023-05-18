#wget https://aka.ms/dependencyagentlinux
#sh InstallDependencyAgent-Linux64.bin -s
##install and apply the CEF collector
#sudo yum update -y
#sudo yum install -y python2
#sudo update-alternatives --remove-all python
#sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 1
sudo setenforce 0
sudo sed -i 's/enforcing/permissive/g' /etc/selinux/config
sudo lvextend --size +28G /dev/mapper/rootvg-rootlv
#sudo xfs_growfs /dev/mapper/rootvg-rootlv
#wget -O cef_installer.py #https://raw.githubusercontent.com/schoonercg/azuretools/master/cef_installer.py
#sudo python3 cef_installer.py $1 $2
##Changing the source of the TimeGenerated field
#wget -O TimeGeneratedG.py #https://raw.githubusercontent.com/schoonercg/azuretools/master/Time_GeneratedG.py
#sudo python3 TimeGeneratedG.py $1
#sudo sed -i '46 s/^/#/' /etc/rsyslog.conf
#sudo sed -i '49 s/^/#/' /etc/rsyslog.conf
#sudo sed -i '52 s/^/#/' /etc/rsyslog.conf
#sudo sed -i '65 s/^/#/' /etc/rsyslog.conf
sudo firewall-cmd --permanent --zone=public --add-port=514/tcp
sudo firewall-cmd --permanent --zone=public --add-port=514/udp
sudo firewall-cmd --reload
wget -O Forwarder_AMA_installer.py https://raw.githubusercontent.com/schoonercg/azuretools/master/Forwarder_AMA_installer.py
sudo python3 Forwarder_AMA_installer.py
#sudo sleep 60s
#sudo rm /var/lib/waagent/Microsoft.Azure.Diagnostics.LinuxDiagnostic-4.1.6/DistroSpecific.py
#wget -O diagfix.sh https://raw.githubusercontent.com/schoonercg/azuretools/master/diagfix.sh
#sudo diagfix.sh &
#sudo sleep 60 && wget https://raw.githubusercontent.com/Azure/azure-linux-extensions/master/Diagnostic/DistroSpecific.py /var/lib/waagent/Microsoft.Azure.Diagnostics.LinuxDiagnostic-4.1.6/DistroSpecific.py -q
