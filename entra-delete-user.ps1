#script to delete a user

#connect to MS Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

#user to delete
$userPrincipalName = Read-Host "Enter UPN of user to remove"

#delete a user
try {
    $user = Get-MgUser -UserId $UserPrincipalName -ErrorAction Stop
        Write-Host "User found: $UserPrincipalName"

        Remove-MgUser -UserId $userPrincipalName
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logMessage = "$timestamp - Removed user $userPrincipalName"
        Write-Host "✅ $logMessage"
   
    
} catch {
      # Output the full error for better diagnostics
      Write-Host "Error: $_" -ForegroundColor Red

      # Check for specific permission error (403 - Forbidden)
      if ($_ -match "Authorization_RequestDenied|Insufficient privileges|403") {
          Write-Host "Error: You do not have sufficient permissions to delete the user $userPrincipalName." -ForegroundColor Red
      }
      # Check for user not found (404 - Resource not found)
      elseif ($_ -match "Resource '.*' does not exist") {
          Write-Host "Error: User $userPrincipalName does not exist." -ForegroundColor Red
      }
      else {
          Write-Host "An unexpected error occurred: $_" -ForegroundColor Red
      }
   
}
