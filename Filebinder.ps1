# Set the root path to the current working directory
$rootPath = Get-Location
$currentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$isoTimeStamp = (Get-Date).ToUniversalTime().ToString("yyyyMMddTHH.mm.ss") + "Z"
$prefix = "$isoTimeStamp-$((Get-Item $rootPath).Basename)"
$outputFile = "$rootPath\$prefix-all_files.txt"

# Create the 'Archive' folder if it doesn't exist
$archiveFolder = Join-Path $rootPath "Archive"
if (-not (Test-Path $archiveFolder)) {
    New-Item -Path $archiveFolder -ItemType Directory
}

# Move existing files suffixed with '-all_files.txt' to the 'Archive' folder
Get-ChildItem -Path $rootPath -Filter "*-all_files.txt" | Where-Object { $_.FullName -ne $outputFile } | ForEach-Object {
    Move-Item $_.FullName -Destination $archiveFolder
}

# Clear the output file if it already exists
if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

# Initialize a variable to hold the total character count
$totalCharacterCount = 0

Get-ChildItem -Path $rootPath -Recurse -Include *.js, *.jsx, *.html, *.css, *.txt | Where-Object { $_.FullName -notmatch '\\node_modules\\' -and $_.FullName -notmatch '\\build\\' -and $_.FullName -notmatch '\\Archive\\' } | ForEach-Object {
    $relativePath = $_.FullName.Substring($rootPath.Length + 1)
    $fileContent = Get-Content $_.FullName -Raw
    # Accumulate the character count for each file
    $totalCharacterCount += $fileContent.Length
    # Write the relative path and file name to the output file
    Add-Content -Path $outputFile -Value ("`n`n--- $relativePath ---`n`n")
    # Append the file content to the output file
    Add-Content -Path $outputFile -Value $fileContent
    # Add a newline after each file's content for separation
    Add-Content -Path $outputFile -Value "`n"
}

# Write the filename, current date and time, and the total character count at the beginning of the file
$existingContent = Get-Content $outputFile -Raw
Set-Content $outputFile -Value ("Filename: $prefix`nGenerated on: $currentDateTime`nTotal Characters: $totalCharacterCount`n" + $existingContent)
