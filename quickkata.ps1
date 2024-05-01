# Convenience Script to create a C# test solution with Nunit & Moq and a classlib
#
# Run with any of:
# 1) `.\quickkata.ps1` - to accept the default name
# 2) `.\quickkata.ps1 -Name 'DesiredName'`
# 3) `.\quickkata.ps1 'DesiredName'` - The switch isn't strictly needed
#
#
# If you get the '... running scripts is disabled on this system ...' message
# Do either of:
# 1 - (Safest) Copy and paste the commands, including the final newline.
# 2 - (Your risk!) Open an adminstrative terminal and run
#     'set-executionpolicy remotesigned', then this script

param (
   [string]$Name = 'QuickKata'
)

If($Name -like '*kata') {
    $AppProjectName = $Name -replace 'kata'
} Else {
    $AppProjectName = $Name
}
$SlnName = $AppProjectName + 'Kata'
$TestProjectName = $AppProjectName + '.Tests'

dotnet new sln --output $SlnName
dotnet new classlib --output $SlnName/$AppProjectName
dotnet sln $SlnName add $SlnName/$AppProjectName

dotnet new nunit --output $SlnName/$TestProjectName
dotnet add $SlnName/$TestProjectName/ package Moq
dotnet add $SlnName/$TestProjectName/ reference $SlnName/$AppProjectName
dotnet sln $SlnName add $SlnName/$TestProjectName/

echo ('# ' + $SlnName) > $SlnName/readme.md


