# Fork of https://github.com/ChrisTitusTech/powershell-profile/blob/main/Microsoft.PowerShell_profile.ps1
function dirs
{
    if ($args.Count -gt 0)
    {
        Get-ChildItem -Recurse -Include "$args" | Foreach-Object FullName -ErrorAction SilentlyContinue
    }
    else
    {
        Get-ChildItem -Recurse | Foreach-Object FullName -ErrorAction SilentlyContinue
    }
}
