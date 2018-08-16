# mazzy@mazzy.ru, 2018-08-15
# https://github.com/mazzy-ax/Powershell.Chunks

<#
.SYNOPSIS
Splits an array into arrays each not exceeding the given size.

.DESCRIPTION
The native Powershell cmdlet Get-Chunk splits an array into arrays each not exceeding the given size.
The cmdlet preserve or reverse the order of elements depending on the sign of the parameter size.

.EXAMPLE
PS> 'a','b','c','d','e' | Get-Chunk 2
Returns an array of arrays whose length does not exceed 2
Expected result is @( @('a','b'), @('c','d'), @('e') )

.EXAMPLE
PS> Get-Chunk -3 -InputObject @(1,2,3,4,5,6,7,8)
Returns an array of arrays whose length does not exceed 3 and their elements are in reverse order
Expected result is @( @(8,7,6), @(5,4,3), @(2,1) )

.PARAMETER size
An integer specifies the maximum size of a chunk. The last chunk may be smaller.
If size > 0 then the order of the elements is preserved.
If size < 0 then the order of the elements is reversed.
If size = 0 then the cmdlet Get-Chunk returns one array contains all input objects.

.PARAMETER InputObject
Specifies the objects to chunked.

.INPUTS
You can pipe the objects to be chunked to Get-Chunk.

.OUTPUTS
Get-Chunk returns the array of arrays.

.NOTES
With a positive chunk size the cmdlet Get-Chunks sends chunks to the pipe as soon as the chunk is filled.
Otherwise the cmdlet collect all input objects, splits it into chunks and then sends the chunks to the pipe.

.LINK
https://github.com/mazzy-ax/Powershell.Chunks

#>
function Get-Chunk {
    [OutputType("System.Array")]
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [int]$size = 1,

        [Parameter(ValueFromPipeline = $true)]
        $InputObject
    )

    begin {
        $buf = @()
    }

    process {
        $buf += $InputObject

        if ( $size -gt 0 ) {
            # return chunks
            $start = 0
            $end = $size - 1
            $last = $buf.Count - 1
            while ($end -le $last) {
                , $buf[$start..$end]

                $start = $end + 1
                $end += $size
            }

            # store only items to be used, release unused elements for a Garbage Collection
            if ($start -gt $last) {
                $buf = @()
            }
            elseif ( $start -ne 0 ) {
                $buf = $buf[$start..$last]
            }
        }
    }

    end {
        if ( $size -lt 0 ) {
            # return a reverse ordered chunks
            $start = -1
            $end = $size
            $last = - $buf.Count
            while ($end -ge $last) {
                , $buf[$start..$end]

                $start = $end - 1
                $end += $size
            }

            if ($start -lt $last) {
                $buf = @()
            }
            elseif ( $start -ne -1 ) {
                $buf = $buf[$start..$last]
            }
        }

        if ( $buf ) {
            , $buf
            $buf = @()  # release unused elements for a Garbage Collection
        }
    }
}

Export-ModuleMember -Function Get-Chunk