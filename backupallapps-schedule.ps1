Param(
    [Parameter(Mandatory = $false)]
    [string]$myResourceGroup,
    [Parameter(Mandatory = $false)]
    [string]$location
    )
$Name = "mcpbackupstorage"
$container = "mcpbackups"

if ([string]::IsNullOrEmpty($(Get-AzureRmContext).Account)) {
    try {
        Login-AzureRmAccount
        $subscriptionId = Get-AzureRmSubscription | Out-GridView -PassThru -Title "Select your subscription"
        Set-AzureRmContext -SubscriptionId $subscriptionId.subscriptionId
        Write-Output "Set subscription to $($subscriptionId.Name)"
    }
    catch {
        $error[0].Exception
        Write-output "Did you select a subscription? Stopping script execution"
        Exit
    }
}

if ([string]::IsNullOrEmpty($myResourceGroup)) {
Write-Output "Select a resource group to with the Azure resources to work against"
$myResourceGroup = (Get-AzureRmResourceGroup | Out-GridView -PassThru -Title "Select a resource group to with the Azure resources to work against").ResourceGroupName
Write-Output "Working on Resource Group $myResourceGroup"
}
$storage = Get-AzureRmStorageAccount -ResourceGroupName $myResourceGroup -Name $Name
if ([string]::IsNullOrEmpty($storage)){Write-output "Storage Exists"} else {
$storage = New-AzureRmStorageAccount -ResourceGroupName $myResourceGroup -Name $Name -Location $location -SkuName Standard_LRS -Kind StorageV2 -Verbose
}

$doescontainerexist = Get-AzureRmStorageContainer -Name $container -ResourceGroupName $myResourceGroup -StorageAccountName $Name
if ([string]::IsNullOrEmpty($doesstorageexist)){Write-output "Container Exists"} else {
New-AzureRmStorageContainer -name $container -ResourceGroupName $myResourceGroup -StorageAccountName $Name
}
$sasurl = New-AzureStorageContainerSASToken -Name $container -Permission rwdl -Context $storage.Context -ExpiryTime (Get-Date).AddMonths(1) -FullUri

#Backup Loop
$scSites = Get-AzureRmWebApp -ResourceGroupName $myResourceGroup
foreach ($site in $scSites)
{
 #write-host "Web App: $($site.RepositorySiteName)" -ForegroundColor Green
 $webappname = ($site.RepositorySiteName)
 $backupname = "mcp-" + $webappname + "-backup"+ (get-date -Format MMddyyyy)
 write-host $backupname -ForegroundColor Yellow
 Edit-AzureRmWebAppBackupConfiguration -Name $webappname -ResourceGroupName $myResourceGroup -FrequencyUnit day -FrequencyInterval 7 -KeepAtLeastOneBackup -RetentionPeriodInDays 30 -StorageAccountUrl $sasurl
                      }
Get-AzureRmWebAppBackupList -ResourceGroupName $myResourceGroup -Name $webappname