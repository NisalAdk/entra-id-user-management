#script to delete a user

#connect to MS Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

#user to delete
$userPrincipalName = Read-Host "Enter UPN of user to remove"

#delete a user
Remove-MgUser -UserId $userPrincipalName