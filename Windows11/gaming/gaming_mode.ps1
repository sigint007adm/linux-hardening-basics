# ⚡ gaming_mode.ps1
# Optimiza el sistema para obtener el máximo rendimiento en juegos.
# Ejecutar como Administrador.

Write-Host "--- Modo Gaming ---" -ForegroundColor Yellow

# --- Activar el plan de energía de 'Máximo Rendimiento' ---
# Este plan viene oculto por defecto en Windows.
$HighPerfPlan = "e9a42b02-d5df-448d-aa00-03f14749eb61"
powercfg /s $HighPerfPlan
Write-Host "[OK] Plan de energía 'Máximo Rendimiento' activado." -ForegroundColor Green

# --- Deshabilitar optimizaciones de pantalla completa ---
# Esto puede reducir el input lag en algunos juegos.
$RegPath = "HKCU:\System\GameConfigStore"
Set-ItemProperty -Path $RegPath -Name "GameDVR_FSEBehaviorMode" -Value 2 -Type DWord -Force
Set-ItemProperty -Path $RegPath -Name "GameDVR_HonorUserFSEBehaviorMode" -Value 1 -Type DWord -Force
Write-Host "[OK] Optimizaciones de pantalla completa deshabilitadas a nivel global." -ForegroundColor Green

# --- Deshabilitar el algoritmo de Nagle (mejora la latencia de red) ---
$NagleRegPath1 = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces"
Get-ChildItem -Path $NagleRegPath1 | ForEach-Object {
    Set-ItemProperty -Path $_.PsPath -Name "TcpAckFrequency" -Value 1 -Type DWord -Force
    Set-ItemProperty -Path $_.PsPath -Name "TCPNoDelay" -Value 1 -Type DWord -Force
}
Write-Host "[OK] Algoritmo de Nagle deshabilitado para mejorar la latencia de red." -ForegroundColor Green

Write-Host "--- Optimización para Gaming finalizada ---" -ForegroundColor Yellow