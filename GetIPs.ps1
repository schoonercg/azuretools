##Azure Script to Obtain outbound IP addresses for each webapp in a named Resource Group
 [CmdletBinding()]
Param( 
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String] 
        $Name 
        )
 $scSites = Get-AzureRmWebApp -ResourceGroupName $Name 
    foreach ($site in $scSites)
    {
     write-host "Web App: $($site.DefaultHostName)" -ForegroundColor Green 
   (Get-AzureRmResource -ResourceGroupName $Name -ResourceType Microsoft.Web/sites -ResourceName $site.SiteName).OutboundIpAddresses

     write-host "web App: $($site.OutboundIpAddresses)" -ForegroundColor Yellow

    }