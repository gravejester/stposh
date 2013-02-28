# testing powershell syntax !!!highlighting
#>>Write-Host "Something"
 #>> Write-Host "Something else"
# comment before #>> Write-Host "No way!"

<#
	Testing strings
#>

"simple double quoted string with $variable"

# check

'simple single quoted string with $variable'

# check

"""double"" quoted string with $variable" # OK?

# check

'''single'' quoted string with $variable'

# check

"double quoted string with '$variable'"

# check

'single quoted string with "$variable"'

# check

""
''
""""
"''"
'""'
''''
"'"
'"'

# check

"""This is a string."""

# check

"This string is
valid"

# check

"This string is `
valid but the ` is consumed."

# check

"This string is ``
valid but the ` isn't consumed."

# check

"This string is `
valid. There's a space at the end."

# check

'This is a valid `
string.'

# check

"Some variables $true here and $false there $_"
"Some escaped variables `$true here and `$false there `$_"

# check

'This is some `n ''$%&/ string too '''

# check

"Escaped chars: `", `n, `$, `b, `""
'Escaped chars: `", `n, `$, `b, `"'

# check

$variable = "This string is $($variable.length) characters long"

# check

$hereString = @"
Here strings can also 'contain' $variables
as well as sub ""expressions"" `n(like this one: $($var.count)!)
$($var.count)
<html>
<b>HTML???? really?</b>
</html>
4*7
1024/1KB
"Hello there {0}!"
"@

$hereString2 = @'
Here strings can also "contain" $variables
as well as sub ''expressions'' `n(like this one: $($var.count)!)
<html>
<b>HTML???? really?</b>
</html>
4*7
1024/1KB
"Hello there {0}!"
'@

# check

$arrayOfStrings = "string1","string2","string3","string4"

# check

"Use quotation marks (`") to indicate a string."

# check

"how about `nthis"

# check

'how about `nthis'

# check

Write-Host --% How'bout this eh? c:\program files $variable _/8+9034 # using the Stop-Parsing symbol (new in PSv3)

# check 

@"
    $(1 -lt 0 | get-item | out-thing "j")
    "This is a normal string."
    """""""
    'This is a single quoted string.'
    # this is not a comment.
    $a
"@

@'
    -gt "This that"
'@

# check

test$variable
$script:newVariable
$global:anotherVariable
$env:COMPUTERNAMEE
$this_variable

$this_is_a_vaAriable = 100
${this ` is a variable name} = 100,500
$global:variable
$private:heyyou # Not documented, but it seems to work. TODO: teST!
$script:blah_blah
${script: stupid variable name}

[string]$stringVariable
[int]${intVariable}
[string[]]$arrayOfStringsVariable
[Array]${script:array}

$variable.count 


"We need $global:variables in; strings ${ tooh-torooh }"

# TODO: fix this:
@"
    "We need $global:variables in; strings ${ tooh-torooh }"
"@

# check 

'(?i:(\\$)(?:(private|script|global|env|function|alias|cert|variable|hkcu|hklm|wsman):)?(\\w+))'

$arg
$confirmpreference

$_
$this

$strComputers = @("Server1", "Server2", "Server3")

$EmpNumbers = @{"John Doe" = 112233; "Dave Davis" = 223344; "Justine Smith" = 334455}

$EmpNumbers = @{
	"John Doe" = 112233
	"Dave Davis" = 223344
	"Justine Smith" = 334455
	"Var" = $variable
}

$EmpNumbers["John Doe"]

$array[1]
$array[-1]

# formatting numbers and string replacement variables

$a=19385790464
"{0:N0}" -f $a


$name = "John" # OK?
"Hello there {0}!" -f $name # still ok!

$a = 348 

"Variable '$a' = {0:N2}. Next one:" -f $a
"{0:D8}" -f $a
"{0:C2}" -f $a
"{0:p0}" -f $a
"{0:X0}" -f $a

"{0-X0}" -f $a

"{0:w0}" -f $a

'(\{)(\d+)(:)*((?i:[ndcpx])\d+)(\})'

function MyFunction($withVariable) {
	Write-Host $withVariable
}

function My_Function {
	var($withVariable)
	Write-Host $withVariable
}

# sub expressions

"This string contains a sub expression: $($var.count)"
'This string contains a sub expression: $($var.count)'

"Complex sub expressions. $(Write-Output (Get-Date - ($var.date)))"

if ($results){
		break
	}

filter 

$code = {

filter
 filter

	Write-Host 'This is a scriptblock!'
	$variable = 1024

	$results = get-content .\filename.txt | foreach-object {$_ -eq 'Success'} | .\myscript.ps1 | where-object {$_.Status -eq $true}

	# comment

	if ($results){
		break
	}

	function newFunction{
		#test
	}

	# tet
}

# check

[CmdletBinding(SupportsShouldProcess)]

something -like something else but -notlike $this.

[System.Collections.ArrayList]::GetItDone()

# operators

 + - * / % # artichmetic

 = += -= /= %= # assignment

-eq -ne -gt -lt -le -ge -match -notmatch -replace -like -notlike -in -notin -contains -notcontains # comparison

-band -bor -bxor -bnot # bitwise

-and -or -xor -not ! # logical

> >> 2> 2>&1 # redirection

-split -join # split and join

-is -isnot -as # type

++ -- # unary

@(Get-WMIObject win32_logicalDisk -ComputerName $computer) # array subexpression

& # call

[ ] # cast/index

, # comma

. # dot sourcing (note: followed by space, as opposed to the dot for current directory)

-f # format

| # pipe

. # property dereference - properties and methods of an object

.. # range

:: # static member  .EXAMPLE

$($x * 23)  $(Get-WMIObject win32_Directory) # subexpression


 Backup-GPO

foreach ($item in $array){
	Get-Service | foreach-object {$_}
	break
}

function Get-Uptime {
	# do some function stuff
}

$computer = "computer"
$result = Get-Uptime -computer $computer

# checking cmdlets

Sort-Object, split-path, TEST-WSMAN
Add-ClusterNode, add-nlbclustervip, get-gitstatus,add-passthroughdevice,get-applockerpolicy,test-applockerpolicy,
invoke-cimmethod,get-cimsession, enable-adaccount, get-adcomputerserviceaccount, get-gpstartergpo, set-gppermissions #etc

<#
.SYNOPSIS
Short description

.DESCRIPTION
Detailed description

.PARAMETER parameter
Description of parameter

.EXAMPLE
Example text

.INPUTS


.OUTPUTS


.NOTES


.LINK

#>

