using namespace System.Net
using namespace Microsoft.IdentityModel.Clients.ActiveDirectory

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

#Get-Module -ListAvailable | Select-Object Name, Version | Sort-Object -Property Name

Write-Host "Import module Microsoft.Graph.Intune"
#Import-Module Microsoft.Graph.Intune
Import-Module "D:\home\site\wwwroot\modules\microsoft.graph.intune.6.1907.1\Microsoft.Graph.Intune.psd1"

Write-Host "Import module AzureAD"
#Import-Module AzureAD -UseWindowsPowerShell
Import-Module "D:\home\site\wwwroot\modules\azuread.2.0.2.106\AzureAD.psd1" -UseWindowsPowerShell

Write-Host "Import module WindowsAutoPilotIntune"
#Import-Module WindowsAutoPilotIntune
Import-Module "D:\home\site\wwwroot\modules\windowsautopilotintune.4.8.0\WindowsAutoPilotIntune.psd1"

Write-Host "Try Connect-MSGraph"
$ClientSecret = "notASecret"
Connect-MSGraph -ClientSecret $ClientSecret -Quiet

# Associate values to output bindings by calling 'Push-OutputBinding'
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = "OK"})
