#wget https://aka.ms/dependencyagentlinux
#sh InstallDependencyAgent-Linux64.bin -s

##install and apply the CEF collector
yum update -y
sudo setenforce 0
sudo sed -i 's/enforcing/permissive/g' /etc/selinux/config
wget -O cef_installer.py https://raw.githubusercontent.com/schoonercg/azuretools/master/cef_installer.py
python3 cef_installer.py $1 $2
##Changing the source of the TimeGenerated field
wget -O TimeGeneratedG.py https://raw.githubusercontent.com/schoonercg/azuretools/master/Time_GeneratedG.py
python3 TimeGeneratedG.py $1
