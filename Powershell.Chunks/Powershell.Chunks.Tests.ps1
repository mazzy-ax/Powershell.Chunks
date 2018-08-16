$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = Split-Path -Leaf $here
Import-module "$here\$sut.psd1" -Force

Describe "Unit tests for a $sut" -Tag Run, UnitTest, UT {

    Context "Get-Chunk functional" {

        It "No parameters" {
            Get-Chunk | Should -BeNullOrEmpty
        }

        It "A null array chunked by <num> with a is null" -TestCases `
        @{ num = -2 },
        @{ num = -1 },
        @{ num = 0 },
        @{ num = 1 },
        @{ num = 2 } {
            Param($num)
            Get-Chunk $num | Should -BeNullOrEmpty
        }

        It "Param: An array chunked by 0 is the same array" {
            $orig = @(1, 2, 3, 4)
            $res = Get-Chunk 0 -InputObject $orig
            $res | Should -Be $orig
            $res -eq $orig | Should -BeFalse
        }

        It "Param: An chuncked array is the same array if a size is not defined" {
            $orig = @(1, 2, 3, 4)
            $res = Get-Chunk -InputObject $orig
            $res | Should -Be $orig
            $res -eq $orig | Should -BeFalse
        }

        It "Param: 3 elements chunked by 1" {
            Get-Chunk 1 -InputObject @('a', 'b', 'c') | Should -Be @( @('a'), @('b'), @('c') )
        }

        It "Param: 3 elements chunked by -1 (reverse order)" {
            Get-Chunk -1 -InputObject @('a', 'b', 'c') | Should -Be @( @('c'), @('b'), @('a') )
        }

        It "Param: 4 elements chunked by 2" {
            Get-Chunk 2 -InputObject @(1, 2, 3, 4) | Should -Be @( @(1, 2), @(3, 4) )
        }

        It "Param: 4 elements chunked by -2" {
            Get-Chunk -2 -InputObject @(1, 2, 3, 4) | Should -Be @( @(4, 3), @(2, 1) )
        }

        It "Param: 5 elements chunked by 2" {
            Get-Chunk 2 -InputObject @(1, 2, 3, 4, 5) | Should -Be @( @(1, 2), @(3, 4), @(5) )
        }

        It "Param: 5 elements chunked by -2" {
            Get-Chunk -2 -InputObject @(1, 2, 3, 4, 5) | Should -Be @( @(5, 4), @(3, 2), @(1) )
        }

        It "Param: 6 elements chunked by 3" {
            Get-Chunk 3 -InputObject @(1, 2, 3, 4, 5, 6) | Should -Be @( @(1, 2, 3), @(4, 5, 6) )
        }

        It "Param: 6 elements chunked by -3" {
            Get-Chunk -3 -InputObject @(1, 2, 3, 4, 5, 6) | Should -Be @( @(6, 5, 4), @(3, 2, 1) )
        }

        It "Param: 7 elements chunked by 3" {
            Get-Chunk 3 -InputObject @(1, 2, 3, 4, 5, 6, 7) | Should -Be @( @(1, 2, 3), @(4, 5, 6), @(7) )
        }

        It "Param: 7 elements chunked by -3" {
            Get-Chunk -3 -InputObject @(1, 2, 3, 4, 5, 6, 7) | Should -Be @( @(7, 6, 5), @(4, 3, 2), @(1) )
        }

        It "Pipe: An array chunked by 0 is the same array" {
            $orig = @(1, 2, 3, 4)
            $res = $orig | Get-Chunk 0
            $res | Should -Be $orig
            $res -eq $orig | Should -BeFalse
        }

        It "Pipe: An chuncked array is the same array if a size is not defined" {
            $orig = @(1, 2, 3, 4)
            $res = $orig | Get-Chunk
            $res | Should -Be $orig
            $res -eq $orig | Should -BeFalse
        }

        It "Pipe: 3 elements chunked by 1" {
            'a', 'b', 'c' | Get-Chunk 1 | Should -Be @( @('a'), @('b'), @('c') )
        }

        It "Pipe: 3 elements chunked by -1 (reverse order)" {
            'a', 'b', 'c' | Get-Chunk -1 | Should -Be @( @('c'), @('b'), @('a') )
        }

        It "Pipe: 4 elements chunked by 2" {
            1, 2, 3, 4 | Get-Chunk 2 | Should -Be @( @(1, 2), @(3, 4) )
        }

        It "Pipe: 4 elements chunked by -2" {
            1, 2, 3, 4 | Get-Chunk -2 | Should -Be @( @(4, 3), @(2, 1) )
        }

        It "Pipe: 5 elements chunked by 2" {
            1, 2, 3, 4, 5 | Get-Chunk 2 | Should -Be @( @(1, 2), @(3, 4), @(5) )
        }

        It "Pipe: 5 elements chunked by -2" {
            1, 2, 3, 4, 5 | Get-Chunk -2 | Should -Be @( @(5, 4), @(3, 2), @(1) )
        }

        It "Pipe: 6 elements chunked by 3" {
            1, 2, 3, 4, 5, 6 | Get-Chunk 3 | Should -Be @( @(1, 2, 3), @(4, 5, 6) )
        }

        It "Pipe: 6 elements chunked by -3" {
            1, 2, 3, 4, 5, 6 | Get-Chunk -3 | Should -Be @( @(6, 5, 4), @(3, 2, 1) )
        }

        It "Pipe: 7 elements chunked by 3" {
            1, 2, 3, 4, 5, 6, 7 | Get-Chunk 3 | Should -Be @( @(1, 2, 3), @(4, 5, 6), @(7) )
        }

        It "Pipe: 7 elements chunked by -3" {
            1, 2, 3, 4, 5, 6, 7 | Get-Chunk -3 | Should -Be @( @(7, 6, 5), @(4, 3, 2), @(1) )
        }

    }
}

