#Script to interactively create user in MS Entra Id

#connect to MS Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Secure password input
$passwordSecure = Read-Host "Enter password (input is hidden)" -AsSecureString
$passwordPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($passwordSecure)
)

# Build password profile
$passwordProfile = @{
    Password = $passwordPlain
    ForceChangePasswordNextSignIn = $true
}

#Define attributes 
 $displayname = Read-Host "Enter display name"
 $mailnickname = Read-Host "Enter mail nickname"
$userPrincipalName = Read-Host "Enter UPN"


#Create user 
New-MgUser -DisplayName $displayname -MailNickname $mailnickname -UserPrincipalName $userPrincipalName -PasswordProfile $passwordProfile -AccountEnabled:$true

