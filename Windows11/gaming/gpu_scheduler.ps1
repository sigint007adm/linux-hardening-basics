# ⚡ gpu_scheduler.ps1
# Activa la Programación de GPU acelerada por hardware.
# Ejecutar como Administrador.

Write-Host "--- Activador de Programación de GPU ---" -ForegroundColor Yellow

# --- Ruta del registro para la configuración de gráficos ---
$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"

# Valor 2 para 'Habilitado'
$HwSchMode = 2

# --- Aplicar la configuración ---
Set-ItemProperty -Path $RegPath -Name "HwSchMode" -Value $HwSchMode -Type DWord -Force

Write-Host "[OK] Programación de GPU acelerada por hardware ha sido activada." -ForegroundColor Green
Write-Host "¡IMPORTANTE! Debes reiniciar tu PC para que el cambio surta efecto." -ForegroundColor Cyan