# WMI object
$computerName = $env:computername

$diskParameters = Get-WmiObject -Class Win32_DiskDrive | Select-Object DeviceID, Model, Size

$cpuUsage = Get-WmiObject -Class Win32_PerfFormattedData_PerfOS_Processor | Where-Object {$_.Name -eq "_Total"} | Select-Object -ExpandProperty PercentProcessorTime

$memory = Get-WmiObject -Class Win32_OperatingSystem | Select-Object @{Name="TotalMemory"; Expression={[math]::Round($_.TotalVisibleMemorySize/1024)}}, @{Name="FreeMemory"; Expression={[math]::Round($_.FreePhysicalMemory/1024)}}

$date = Get-Date -Format "yyyy-MM-dd-HH-mm-ss"
$data = "Computer Name: $computerName`nDisk Parameters:`n$($diskParameters | Format-Table | Out-String)`nCPU Usage: $cpuUsage%`nTotal Memory: $($memory.TotalMemory) MB`nFree Memory: $($memory.FreeMemory) MB"
$data | Out-File "$PSScriptRoot\$date-system-info.txt"

# Services
Get-Service | Where-Object {$_.Status -EQ "Running"} | Out-File "$PSScriptRoot\running_processes.txt"
Get-Service | Where-Object {$_.Status -EQ "Stopped"} | Out-File "$PSScriptRoot\stopped_processes.txt"


function GetServiceStatus {
    param(
        [Parameter(Mandatory=$true)]
        [string]$ServiceName
    )

    $service = Get-Service -Name $ServiceName

    if ($service) {
        Write-Output "$ServiceName is $($service.Status)"
    } else {
        Write-Error "Could not find service $ServiceName"
    }
}

$service = Read-Host("Input service name")
GetServiceStatus -ServiceName $service -ErrorAction SilentlyContinue


#EventLogs
function GetEvents {
  param (
    [string]$ProgramName,
    [int]$NumberOfEvents
  )

  $events = Get-EventLog -LogName Application -Source $ProgramName -Newest $NumberOfEvents -ErrorAction SilentlyContinue
  $date = Get-Date -Format "yyyyMMdd"
  $filename = "${ProgramName}_${date}.txt"
  $events | Out-File -FilePath $filename
}

Get-Events -ProgramName "Microsoft Office Alerts" -NumberOfEvents 10

# Sysinternals
$domain = Read-Host "Enter domain name"
& "$PSScriptRoot\whois64.exe" $domain | Out-File -FilePath "$PSScriptRoot\domain.txt"

Register-ScheduledTask -TaskName "PsScript" -Trigger (New-ScheduledTaskTrigger -Daily -At "22:00") -Action (New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\Path\To\Script.ps1") -Principal (New-ScheduledTaskPrincipal -GroupId "Administrators" -RunLevel Highest) -Settings (New-ScheduledTaskSettingsSet -Compatibility Win8)
