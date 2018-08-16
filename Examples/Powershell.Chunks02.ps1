#Requires -module Powershell.Chunks

# To install the module from https://www.powershellgallery.com/packages/Powershell.Chunks run the powershell command:
# PS> Install-Module Chunk
#
# see https://github.com/mazzy-ax/Powershell.Chunks for details

"a", "b", $null, "c", "d", "e", "f" | Get-Chunk -3 | ForEach-Object {
    "$_"
}

# Expected output (note the empty value between c and b):
# f e d
# c  b
# a