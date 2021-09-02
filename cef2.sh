#wget https://aka.ms/dependencyagentlinux
#sh InstallDependencyAgent-Linux64.bin -s

##install and apply the CEF collector
yum update -y
sudo setenforce 0
wget -O prepare_vm_disks.sh https://raw.githubusercontent.com/schoonercg/azuretools/master/prepare_vm_disks.sh
sudo chmod +x ./prepare_vm_disks.sh
sudo ./prepare_vm_disks.sh
wget -O cef_installer.py https://raw.githubusercontent.com/schoonercg/azuretools/master/cef_installer.py
python3 cef_installer.py $1 $2
##Changing the source of the TimeGenerated field
wget -O TimeGeneratedG.py https://raw.githubusercontent.com/schoonercg/azuretools/master/Time_GeneratedG.py
python3 TimeGeneratedG.py $1
sudo sed -i '46 s/^/#/' rsyslog.conf
sudo sed -i '49 s/^/#/' rsyslog.conf
sudo sed -i '52 s/^/#/' rsyslog.conf
sudo sed -i '65 s/^/#/' rsyslog.conf
