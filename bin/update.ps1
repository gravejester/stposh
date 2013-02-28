# stposh build functions

# get all approved verbs and update the regex for the smartFunctionMatch
$approvedVerbs = '\\b(?i:'
Get-Verb | Select-Object -ExpandProperty Verb | ForEach-Object {$approvedVerbs += "$_`|"}
$approvedVerbs += ')-(?i:\\w+)\\b'

# update the regex for the default powershell cmdlet match
$defaultCmdlets = '\\b(?i:'
Get-Command | Where-Object {$_.CommandType -eq 'Cmdlet'} | Select-Object -ExpandProperty Name | ForEach-Object {$defaultCmdlets += "$_`|"}  
$defaultCmdlets += ')\\b'
