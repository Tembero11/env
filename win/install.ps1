function HasScoop () {
    try {
        Get-Command scoop -ErrorAction Stop | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

function InstallScoop() {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}


if (HasScoop) {
    Write-Host "Scoop is installed and the 'scoop' command is available in your PATH."
}
else {
    Write-Host "Scoop is NOT installed or the 'scoop' command is not in your PATH. Installing..."

    try {
        InstallScoop
        Write-Host "Scoop Installed"
    }
    catch {
        Write-Host "Failed to install scoop"
    }

    Write-Host "Importing scoop environment"

    & "scoop import ./scoop.json"

}