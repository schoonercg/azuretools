#wget https://aka.ms/dependencyagentlinux
#sh InstallDependencyAgent-Linux64.bin -s

##install and apply the CEF collector
apt-get update
wget -O cef_installer.py https://remotestatessa.blob.core.windows.net/customlogs/cef_installer.py
python3 cef_installer.py $1 $2
##Changing the source of the TimeGenerated field
wget -O TimeGeneratedG.py https://remotestatessa.blob.core.windows.net/customlogs/Time_GeneratedG.py
python3 TimeGeneratedG.py $1
