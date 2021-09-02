
#wget https://aka.ms/dependencyagentlinux
#sh InstallDependencyAgent-Linux64.bin -s

##install and apply the CEF collector
yum update -y
sudo setenforce 0
sudo sed -i 's/enforcing/permissive/g' /etc/selinux/config
wget -O prepare_vm_disks.sh https://raw.githubusercontent.com/schoonercg/azuretools/master/prepare_vm_disks.sh
sudo chmod +x ./prepare_vm_disks.sh
sudo ./prepare_vm_disks.sh
sleep 2m
wget -O cef_installer.py https://raw.githubusercontent.com/schoonercg/azuretools/master/cef_installer.py
sudo python3 cef_installer.py $1 $2
sleep 2m
##Changing the source of the TimeGenerated field
wget -O TimeGeneratedG.py https://raw.githubusercontent.com/schoonercg/azuretools/master/Time_GeneratedG.py
sudo python3 TimeGeneratedG.py $1
sleep 1m
sudo sed -i '46 s/^/#/' /etc/rsyslog.conf
sudo sed -i '49 s/^/#/' /etc/rsyslog.conf
sudo sed -i '52 s/^/#/' /etc/rsyslog.conf
sudo sed -i '65 s/^/#/' /etc/rsyslog.conf
