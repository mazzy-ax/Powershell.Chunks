# Powershell.Chunks

[project]:https://github.com/mazzy-ax/Powershell.Chunks
[license]:https://github.com/mazzy-ax/Powershell.Chunks/blob/master/LICENSE
[ps]:https://www.powershellgallery.com/packages/Powershell.Chunks
[nuget]:https://www.nuget.org/packages/mazzy.Powershell.Chunks
[appveyor]:https://ci.appveyor.com/project/mazzy-ax/powershell-chunks

[![Build status](https://ci.appveyor.com/api/projects/status/n1m7pwssqxnsxgth?svg=true)][appveyor]
[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/Powershell.Chunks.svg)][ps]
[![NuGet](https://buildstats.info/nuget/mazzy.Powershell.Chunks)][nuget]

[Powershell.Chunks][project] is a Powershell cmdlet that splits an array into arrays each not exceeding the given size.
The cmdlet preserve or reverse the order of elements depending on the sign of the parameter size.

## Examples

```powershell
'a','b','c','d','e' | Get-Chunk 2             # Returns @( @('a','b'), @('c','d'), @('e') )

Get-Chunk -3 -InputObject @(1,2,3,4,5,6,7,8)  # Returns @( @(8,7,6), @(5,4,3), @(2,1) )
```

More [Examples](Examples).

## Installation

Automatic install the module from the [PowerShell Gallery][ps]:

```powershell
Install-Module -Name Powershell.Chunks
Import-Module Powershell.Chunks
```

Automatic install the module from the [NuGet.org][nuget]:

```shell
nuget install mazzy.Powershell.Chunks
```

or manual:

* Download and unblock the latest [.zip file](https://github.com/mazzy-ax/Powershell.Chunks/archive/master.zip).
* Extract the .zip into your `$PSModulePath`, e.g. `~\Documents\WindowsPowerShell\Modules`.
* Ensure the extracted folder is named `Powershell.Chunks`.
* Set an execution policy to `RemoteSigned` or `Unrestricted` to execute not signed modules `Set-ExecutionPolicy RemoteSigned`.
* Run `Import-Module Permutation`.

## Changelog

* [CHANGELOG.md](CHANGELOG.md)
* <https://github.com/mazzy-ax/Powershell.Chunks/releases>.

## License

This project is released under the [licensed under the MIT License][license].

<mazzy@mazzy.ru>