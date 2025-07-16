# PowerShell script to output system info to coworker_specs_windows.txt

$output = "coworker_specs_windows.txt"

Get-ComputerInfo | Out-File -FilePath $output -Encoding utf8
Get-CimInstance Win32_Processor | Out-File -Append -FilePath $output
Get-CimInstance Win32_PhysicalMemory | Out-File -Append -FilePath $output
Get-CimInstance Win32_DiskDrive | Out-File -Append -FilePath $output
Get-CimInstance Win32_VideoController | Out-File -Append -FilePath $output
Get-NetIPConfiguration | Out-File -Append -FilePath $output

Write-Output "✅ System info saved to $output"
