#wget https://aka.ms/dependencyagentlinux
#sh InstallDependencyAgent-Linux64.bin -s

##install and apply the CEF collector
yum update
sudo setenforce 0
wget -O prepare_vm_disks.sh https://raw.githubusercontent.com/Azure-Samples/compute-automation-configurations/master/prepare_vm_disks.sh
prepare_vm_disks.sh
wget -O cef_installer.py https://raw.githubusercontent.com/schoonercg/azuretools/master/cef_installer.py
python3 cef_installer.py $1 $2
##Changing the source of the TimeGenerated field
wget -O TimeGeneratedG.py https://raw.githubusercontent.com/schoonercg/azuretools/master/Time_GeneratedG.py
python3 TimeGeneratedG.py $1
