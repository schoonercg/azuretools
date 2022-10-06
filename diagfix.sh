sudo sleep 60s
sudo rm /var/lib/waagent/Microsoft.Azure.Diagnostics.LinuxDiagnostic-4.1.6/DistroSpecific.py
sudo wget /var/lib/waagent/Microsoft.Azure.Diagnostics.LinuxDiagnostic-4.1.6/DistroSpecific.py https://raw.githubusercontent.com/Azure/azure-linux-extensions/master/Diagnostic/DistroSpecific.py -q
