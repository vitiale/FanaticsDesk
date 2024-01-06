$directory = "C:\Users\SD-vlirianoluis\Documents\test1"

# Get the current user's name
$currentUsername = $env:USERNAME

# Define an array of folder names to preserve, including the current username
$folderArray = @("a", "aa", "aaa", "cc", $currentUsername, "Public", "Default")

Write-Host "Deleting folders not in the array from " + $directory
Get-ChildItem -Path $directory -Directory | ForEach-Object {
    if ($folderArray -notcontains $_.Name) {
        Write-Host "Deleting: $($_.FullName)"
        Remove-Item -Path $_.FullName -Recurse -Force
    }
}

Read-Host -Prompt "Press Enter to exit"