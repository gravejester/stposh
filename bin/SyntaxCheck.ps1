# Script to test Sublime Text syntax highlighting

 # These function declarations should all be highlighted and show up in the symbols list
function MyFunction{}
function My-Function         {}
function My.Function{}
function My-Function.Other{}
function Some.other.function{}
function MyFunction2 {}
function MyFunction3
{

}

# This one should not be matched (except the reserved word 'function')
function MyFunction4 sdklskdls



# --% instructs the parser to stop parsing until next line
echoargs.exe --% %USERNAME%,this=$something{weird 1} # line comments should still work

# Block comments
<#
	Block comments
	[int]$const = 1024
#>

# If you want to place som temporary code for debugging or testing,
# you can tag the comment with DEBUG! to make it stand out.

# Reserved words
begin process exit break filter return catch finally sequence class for switch continue foreach
throw data from trap define function try do if until dynamicparam in using else inlinescript
var elseif parallel while end param workflow where

# .NET classes
[int] [string[]] [System.Net.HttpWebRequest]

# Parameters
Get-Service -Name 'WinRM'

# Generic function/command matching based on approved verbs
Get-Whatever Hide-Myself

# Operators
 + - / * % = += -= /= %= ++ -- -eq -ne -ceq -notmatch -contains -band -bnot -and -or -xor -split -join -as -in ! -not

# Script Block
{
	$var = 'Script Block'
	Write-Host "Inside a $var"
	$i = 1
}

# Hash Table
$outHash = @{
	ComputerName = $ComputerName
	IP = $IP.ToString()
	Status = "OK"
	Number = 1
}

# Sub Expression
$var = 'Sub Expression'
$string = "String with a $($var)!"

# Here String Double
$query = @"
	SELECT * FROM users WHERE $Name LIKE '%John%'
"@

# Here String Single
$query = @'
	SELECT * FROM users WHERE $Name LIKE ''%John%''
'@

# Double quoted string
"Double quoted string"
"Double ""quoted"" string"
"Double 'quoted' string"
"String with $($subExpression + 1) and $variable"

# Single quoted string
'Single quoted string'
'Single ''quoted'' string'
'Single "quoted string'
'String with $($subExpression + 1) and $variable'

# Variables
$variable
${variable}
$script:variable
${script:variable}
$_

# Numeric Constants
100
35,2
678.45
1024mb

# Advanced Function
Function Test-Function{
	[CmdletBinding(SupportsShouldProcess = $true)]
	[OutputType([string])]

	param(
		[Parameter(Position = 0, ValueFromPipeline = $true)]
		[Alias("PSComputerName","Name")]
		[string[]]$ComputerName = $env:COMPUTERNAME,

		[Parameter(Position = 1)]
		[ValidateNotNull()]
		[int]$Timeout = 10000, # ms

		[switch]$PerformCheck = $false
	)

	BEGIN{
		Write-Verbose "Timeout is set to $Timeout"
	}

	PROCESS{
		foreach ($computer in $computers){
			Write-Host $computer
		}
	}

	END{Write-Host 'Goodbye'}
}

# Advanced functions outside of a script block
[CmdletBinding()]
[OutputType([string])]
param(
	[Parameter(Position = 0, Mandatory = $true)]
	[string]$p
)

BEGIN{

}

PROCESS{
}

END{
}

# Filters
filter Get-ErrorLog ([switch]$message)
{
  if ($message) { out-host -inputobject $_.Message }
  else { $_ }
}