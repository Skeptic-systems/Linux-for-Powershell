function sudo {
    param (
        [Switch]$Skript,
        [Parameter(ValueFromRemainingArguments = $true)]
        $Arguments
    )
    # Path of the Powershell installation
    $powershellPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PowerShell\PowerShell 7 (x64).lnk"
    if ($Skript) {
        $scriptBlock = $Arguments -join ' '
        # Run new elevated shell with the scriptBlock args
        Start-Process $powershellPath -Verb runAs -ArgumentList "-NoExit", "-Command", "& {$scriptBlock}"}
        # Run new elevated shell with the following commands behind sudo
    elseif ($Arguments) {
        $command = $Arguments -join ' '
        Start-Process $powershellPath -Verb runAs -ArgumentList "-NoExit", "-Command", $command}
        # Run new elevated shell
    else {
        Start-Process $powershellPath -Verb runAs
    }
}
