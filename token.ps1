<#
    .SYNOPSIS
    Perform Search and Replace operation across the ./source folder.

    .DESCRIPTION
    Perform Search and Replace operation across the ./source folder.
    Finding token=value and replacing with TOKEN value from ./.env file.

    .NOTES
    Requires ./env file to be created beforehand.

    .EXAMPLE
    .\token.ps1

    .LINK
    https://github.com/ATAK-Denmark/dataforsyningen-maps
#>

[CmdletBinding()]
param()

try {
    Write-Verbose -Message "Attempting to set `$TOKEN variable using ./.env file."
    $TOKEN = (Get-Content -Path "./.env" -ErrorAction Stop | Where-Object { $_ -Match "^TOKEN=" }).Replace("TOKEN=", "")
} catch {
    throw $_
}

Write-Host -Object "Settings new token: $TOKEN"

Write-Verbose -Message "Looking for .xml files in ./source directory."
Get-ChildItem -Path "./source" -Recurse -Filter "*.xml" | ForEach-Object {
    $content = Get-Content -Path $_.FullName

    # look for "token=*&|?", if found replace with "token=$TOKEN&|?"
    $updatedContent = $content -Replace '(token=)[a-z0-9]*([&?])', "`$1$TOKEN`$2"

    try {
        Set-Content -Path $_.FullName -Value $updatedContent -ErrorAction Stop
    } catch {
        throw $_
    } finally {
        Write-Verbose -Message "Processed file: $($_.Name)."
    }
}
