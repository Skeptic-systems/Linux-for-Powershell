function apt {
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [string]$Command,
        [Parameter(Position = 1, ValueFromRemainingArguments = $true)]
        [string]$Arguments
    )
  
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    $isAdmin = (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    # Here could be check if choco is installed (I dont need that)
    if ($isAdmin) {
        # If the current session has administrator rights, directly execute the Chocolatey command
        $chocoCommand = "choco $Command $Arguments"
        Invoke-Expression $chocoCommand
    } else {
        # If the current session does not have administrator rights, open a new PowerShell session with administrator rights
        $script = "choco $Command $Arguments"
        Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PowerShell\PowerShell 7 (x64).lnk" -Verb runAs -ArgumentList "-NoExit", "-Command", "& $script"
    }
  }
