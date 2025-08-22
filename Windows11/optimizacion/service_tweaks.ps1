# ⚡ service_tweaks.ps1
# Deshabilita servicios innecesarios para liberar recursos del sistema.
# Ejecutar como Administrador.

Write-Host "--- Ajuste de Servicios de Windows ---" -ForegroundColor Yellow

# --- Lista de servicios a deshabilitar ---
# Estos servicios son seguros de deshabilitar para la mayoría de usuarios.
# Si usas alguna funcionalidad específica (como faxes o mapas sin conexión),
# comenta la línea correspondiente añadiendo un '#' al principio.
$servicesToDisable = @(
    "Fax",                          # Servicio de Fax (si no usas fax)
    "MapsBroker",                   # Agente de mapas descargados (para mapas sin conexión)
    "PrintSpooler",                 # Cola de impresión (si no usas impresora)
    "RemoteRegistry",               # Registro Remoto (riesgo de seguridad)
    "WalletService",                # Servicio de Cartera de Microsoft
    "XboxGipSvc",                   # Servicio de Accesorios de Xbox
    "XboxNetApiSvc"                 # Servicio de red de Xbox Live
)

foreach ($service in $servicesToDisable) {
    try {
        Write-Host "Configurando servicio: $service" -ForegroundColor Cyan
        Get-Service -Name $service | Set-Service -StartupType Disabled -Status Stopped -ErrorAction Stop
        Write-Host "[OK] Servicio '$service' detenido y deshabilitado." -ForegroundColor Green
    }
    catch {
        Write-Host "[ERROR] No se pudo modificar el servicio '$service'. Puede que no esté instalado." -ForegroundColor Red
    }
}

Write-Host "--- Ajuste de servicios finalizado ---" -ForegroundColor Yellow