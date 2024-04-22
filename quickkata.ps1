# Convenience Script to create a C# test solution with Nunit & Moq and a classlib
#
# If you get the '... running scripts is disabled on this system ...' message
# Do either of:
# 1 - (Safest) Copy and paste the commands, including the final newline.
# 2 - (Your risk!) Open an adminstrative terminal and run
#     'set-executionpolicy remotesigned', then this script

dotnet new sln --output QuickKata
dotnet new nunit --output QuickKata/Tests
dotnet add QuickKata/Tests/Tests.csproj package Moq
dotnet sln QuickKata add QuickKata/Tests
dotnet new classlib --output QuickKata/App
dotnet sln QuickKata add QuickKata/App
