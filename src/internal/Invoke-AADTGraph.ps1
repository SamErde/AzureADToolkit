<#
.SYNOPSIS
    Run a Microsoft Graph Command
.EXAMPLE
    PS C:\>Get-MsGraphResults 'users'
    Return query results for first page of users.
.EXAMPLE
    PS C:\>Get-MsGraphResults 'users' -ApiVersion beta
    Return query results for all users using the beta API.
.EXAMPLE
    PS C:\>Get-MsGraphResults 'users' -UniqueId 'user1@domain.com','user2@domain.com' -Select id,userPrincipalName,displayName
    Return id, userPrincipalName, and displayName for user1@domain.com and user2@domain.com.
#>
function Invoke-AADTGraph{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        [string]$Uri,
        [Parameter(Mandatory = $false)]
        [string]$Body,
        [Parameter(Mandatory = $false)]
        [string]$Method = 'GET'
    )
    
    if(!(Get-MgContext)){
        Write-Error "You must call the Connect-AADToolkit cmdlet before calling any other cmdlets." -ErrorAction Stop
    }
    $uri = 'https://graph.microsoft.com/v1.0' + $uri
    if($Method -eq 'GET'){
        return Invoke-GraphRequest -Uri $uri -Method $method
    }
    else {
        return Invoke-GraphRequest -Uri $uri -Body $body -Method $method -ContentType 'application/json'
    }
    
}