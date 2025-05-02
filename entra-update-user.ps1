#update entraId user

Connect-MgGraph -Scopes "User.ReadWrite.All"

   #user to update
        $UserPrincipalName = Read-Host "Enter user principal name to edit"
        $newdisplayname = Read-Host "Enter new display name"
    
    


#call to update the user

Update-MgUser -UserId $UserPrincipalName -DisplayName $newdisplayname