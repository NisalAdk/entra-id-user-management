#update entraId user

Connect-MgGraph -Scopes "User.ReadWrite.All"
Write-Host "Connected to MS Graph"

   #user to update
        $UserPrincipalName = Read-Host "Enter user principal name to edit"
        $newdisplayname = Read-Host "Enter new display name"
    
    



try {
        #call to find the user
        $user = Get-MgUser -UserId $UserPrincipalName -ErrorAction Stop
        Write-Host "User found: $UserPrincipalName"

        #call to update the user
        Update-MgUser -UserId $UserPrincipalName -DisplayName $newdisplayname
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logMessage = "$timestamp - Updated displayname for '$UserPrincipalName' to '$newdisplayname'"
        Write-Host "✅ $logMessage"
        
} catch {
        #incase user is not found
        if ($_ -match "Resource '.*' does not exist") {
                $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
                $errorMessage = "$timestamp - Failed to update user '$UserPrincipalName': $_"
                Write-Host "$errorMessage"
        } else {
                Write-Host "An error occured."
        }

}

