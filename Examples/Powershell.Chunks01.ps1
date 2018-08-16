#Requires -module Powershell.Chunks

# To install the module from https://www.powershellgallery.com/packages/Powershell.Chunks run the powershell command:
# PS> Install-Module Chunk
#
# see https://github.com/mazzy-ax/Powershell.Chunks for details

Get-Chunk 2 -InputObject @(1, 2, 3, 4, 5) | ForEach-Object {
    "$_"
}

# Expected output:
# 1 2
# 3 4
# 5