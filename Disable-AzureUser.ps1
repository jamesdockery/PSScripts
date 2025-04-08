param(
    [Parameter(Mandatory = $true)]
    [string]$UserPrincipalName
)

#Connect if not already connected
if(-not (Get-MgContext)) {
    Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.AccessAsUser.All"
}

#Get the user
$user = Get-MgUser -UserId $UserPrincipalName

if($user){
    #Disable the Account
    Update-MgUser -UserId $UserPrincipalName -AccountEnabled:$false
    Write-Host "User $UserPrincipalName has been disabled." 
} else{
    Write-Host "User not found: $UserPrincipalName"
}