# Download the installation package
wget https://aka.ms/azcmagent -O ~/install_linux_azcmagent.sh

# Install the hybrid agent
bash ~/install_linux_azcmagent.sh

# Run connect command
azcmagent connect --resource-group "amtraks-resources" --tenant-id "72f988bf-86f1-41af-91ab-2d7cd011db47" --location "eastus" --subscription-id "3bded910-f457-4f24-b54d-39c557e1a584" --cloud "AzureCloud" --correlation-id "1d6f1fa8-f73b-4b97-b3d3-b755281fb017"

if [ $? = 0 ]; then echo "\033[33mTo view your onboarded server(s), navigate to https://ms.portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.HybridCompute%2Fmachines\033[m"; fi
