# ⚡ boot_optimizer.ps1
# Reduce el tiempo de arranque de Windows.
# Ejecutar como Administrador.

Write-Host "--- Optimizador de Arranque ---" -ForegroundColor Yellow

# Deshabilitar el retraso de inicio de los programas en el arranque
# Windows impone un pequeño retraso para que el sistema se cargue más rápido,
# pero esto ralentiza el inicio de tus programas.
$RegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize"

if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

Set-ItemProperty -Path $RegPath -Name "StartupDelayInMSec" -Value 0 -Type DWord -Force

Write-Host "[OK] Retraso de inicio de programas deshabilitado." -ForegroundColor Green

# Habilitar el inicio rápido (Fast Startup)
# Nota: Esto ya suele estar activado por defecto.
# Fast Startup combina el apagado con la hibernación para acelerar el arranque.
$PowerRegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power"
Set-ItemProperty -Path $PowerRegPath -Name "HiberbootEnabled" -Value 1 -Type DWord -Force

Write-Host "[OK] Inicio Rápido (Hiberboot) asegurado como activo." -ForegroundColor Green
Write-Host "--- Optimización de arranque finalizada ---" -ForegroundColor Yellow