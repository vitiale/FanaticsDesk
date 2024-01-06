# Bypass the execution policy for this script
#Set-ExecutionPolicy Bypass -Scope Process -Force

# Set the execution policy to RemoteSigned for the current user with -Force to bypass the confirmation prompt
#Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

$directory = "C:\Users\SD-vlirianoluis\Documents\test1"
#$directory = "C:\Users"

# Get the current user's name
$currentUsername = $env:USERNAME

# Define an array of folder names to preserve, including the current username
$folderArray = @("vlirianoluis", $currentUsername)

Write-Host "Deleting folders not in the array from " + $directory
Get-ChildItem -Path $directory -Directory | ForEach-Object {
    $folderName = $_.Name
    if ($folderArray -contains $folderName -or $folderName -like "*Public*" -or $folderName -like "*Default*") {
        Write-Host "Preserving: $($_.FullName)"
    } else {
        Write-Host "Deleting: $($_.FullName)"
        Remove-Item -Path $_.FullName -Recurse -Force
    }
}

# Revert the execution policy to Restricted for the current user
#Set-ExecutionPolicy Restricted -Scope CurrentUser -Force

Read-Host -Prompt "Press Enter to exit"
