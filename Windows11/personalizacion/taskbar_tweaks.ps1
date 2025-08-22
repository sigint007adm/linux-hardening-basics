# ⚡ taskbar_tweaks.ps1
# Personaliza la barra de tareas y el menú contextual.
# Ejecutar como Administrador.

Write-Host "--- Personalización de la Barra de Tareas ---" -ForegroundColor Yellow

# --- Alinear iconos de la barra de tareas a la izquierda ---
$RegPath_Taskbar = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $RegPath_Taskbar -Name "TaskbarAl" -Value 0 -Type DWord -Force
Write-Host "[OK] Iconos de la barra de tareas alineados a la izquierda." -ForegroundColor Green

# --- Restaurar el menú contextual clásico (clic derecho) ---
$RegPath_ContextMenu = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"
if (-not (Test-Path $RegPath_ContextMenu)) {
    New-Item -Path $RegPath_ContextMenu -Force | Out-Null
}
Set-ItemProperty -Path $RegPath_ContextMenu -Name "(Default)" -Value "" -Type String -Force
Write-Host "[OK] Menú contextual clásico restaurado." -ForegroundColor Green

Write-Host "--- Personalización finalizada ---" -ForegroundColor Yellow
Write-Host "Es necesario reiniciar el Explorador de Windows para aplicar los cambios." -ForegroundColor Cyan
Stop-Process -Name "explorer" -Force