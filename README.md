# Powershell.Chunks

[project]:https://github.com/mazzy-ax/Powershell.Chunks
[license]:https://github.com/mazzy-ax/Powershell.Chunks/blob/master/LICENSE
[ps]:https://www.powershellgallery.com/packages/Powershell.Chunks
[nuget]:https://www.nuget.org/packages/Powershell.Chunks
[appveyor]:https://ci.appveyor.com/project/mazzy-ax/Powershell.Chunks

[![Build status](https://ci.appveyor.com/api/projects/status/n1m7pwssqxnsxgth?svg=true)][appveyor]
[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/Powershell.Chunks.svg)][ps]
[![NuGet](https://buildstats.info/nuget/Powershell.Chunks)][nuget]

[Powershell.Chunks][project] is a powershell native cmdlet that splits an array into arrays each not exceeding the given size.
The cmdlet preserve or reverse the order of elements depending on the sign of the parameter size.

## Examples

```powershell
'a','b','c','d','e' | Get-Chunk 2

Get-Chunk -3 -InputObject @(1,2,3,4,5,6,7,8)
```

More [Examples](Examples).

## Installation

Automatic install the module from the [PowerShell Gallery][ps]:

```powershell
Install-Module -Name Powershell.Chunks
Import-Module Powershell.Chunks
```

Automatic install the module from the [NuGet.org][nuget]:

```powershell
Install-Package -Name Powershell.Chunks
Import-Module Powershell.Chunks
```

or manual:

* Download and unblock the latest .zip file.
* Extract the .zip into your `$PSModulePath`, e.g. `~\Documents\WindowsPowerShell\Modules`.
* Ensure the extracted folder is named `Permutation`.
* Set an execution policy to `RemoteSigned` or `Unrestricted` to execute not signed modules `Set-ExecutionPolicy RemoteSigned`.
* Run `Import-Module Permutation`.

## Changelog

* [CHANGELOG.md](CHANGELOG.md)
* <https://github.com/mazzy-ax/Powershell.Chunks/releases>.

## License

This project is released under the [licensed under the MIT License][license].

<mazzy@mazzy.ru>