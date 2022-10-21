sudo sleep 60s
sudo rm -f /var/lib/waagent/Microsoft.Azure.Diagnostics.LinuxDiagnostic-4.1.6/DistroSpecific.py
sudo cd /var/lib/waagent/Microsoft.Azure.Diagnostics.LinuxDiagnostic-4.1.6/
sudo wget https://raw.githubusercontent.com/Azure/azure-linux-extensions/master/Diagnostic/DistroSpecific.py -q
