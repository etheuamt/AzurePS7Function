
using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

#Get-Module -ListAvailable | Select-Object Name, Version | Sort-Object -Property Name

Write-Host "Import module Microsoft.Graph.Intune"
Import-Module Microsoft.Graph.Intune #-UseWindowsPowerShell

Write-Host "Import module AzureAD"
Import-Module AzureAD -UseWindowsPowerShell

Write-Host "Import module WindowsAutoPilotIntune"
Import-Module WindowsAutoPilotIntune

Write-Host "Try Update-MSGraphEnvironment"
Update-MSGraphEnvironment

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = "OK"})
