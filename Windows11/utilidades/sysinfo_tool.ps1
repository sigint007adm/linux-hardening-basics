# ⚡ sysinfo_tool.ps1
# Muestra información clave del sistema.

Write-Host "--- Información del Sistema ---" -ForegroundColor Yellow

# --- Información del Sistema Operativo ---
$OS = Get-CimInstance Win32_OperatingSystem
Write-Host "Sistema Operativo: $($OS.Caption)" -ForegroundColor Cyan
Write-Host "Versión: $($OS.Version)"
Write-Host "Build: $($OS.BuildNumber)"
Write-Host "Arquitectura: $($OS.OSArchitecture)"
Write-Host "Último arranque: $($OS.LastBootUpTime)"

# --- Información del Hardware ---
$CPU = Get-CimInstance Win32_Processor
$RAM = [math]::Round(($OS.TotalVisibleMemorySize / 1MB), 2)
$GPU = Get-CimInstance Win32_VideoController

Write-Host ""
Write-Host "--- Hardware ---" -ForegroundColor Yellow
Write-Host "CPU: $($CPU.Name)" -ForegroundColor Cyan
Write-Host "RAM Total: $RAM GB"
Write-Host "GPU: $($GPU.Name)"

# --- Información del Disco ---
$Disks = Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }
Write-Host ""
Write-Host "--- Almacenamiento ---" -ForegroundColor Yellow
foreach ($Disk in $Disks) {
    $SizeGB = [math]::Round($Disk.Size / 1GB, 2)
    $FreeGB = [math]::Round($Disk.FreeSpace / 1GB, 2)
    Write-Host "Unidad $($Disk.DeviceID) - Total: $SizeGB GB / Libre: $FreeGB GB" -ForegroundColor Cyan
}

Write-Host ""
Read-Host "Presiona Enter para salir..."