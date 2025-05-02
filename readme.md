# Entra ID User Management Scripts

This repo contains PowerShell scripts to manage users in Microsoft Entra ID using Microsoft Graph.

## Scripts

- `create-user.ps1`: Creates a new user interactively.
- `update-user.ps1`: Updates a user's displayname.
- `delete-user.ps1`: Deletes a user.

## Requirements

- Microsoft Graph PowerShell SDK
- Appropriate Microsoft Graph permissions (`User.ReadWrite.All`)
- Logged in with `Connect-MgGraph`

## Usage

```powershell
.\entra-create-user.ps1
.\entra-update-user.ps1
.\entra-delete-user.ps1
