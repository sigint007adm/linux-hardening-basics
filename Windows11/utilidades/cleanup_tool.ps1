# ⚡ cleanup_tool.ps1
# Limpia archivos temporales y basura del sistema.
# Ejecutar como Administrador.

Write-Host "--- Herramienta de Limpieza ---" -ForegroundColor Yellow

# --- Limpieza de carpetas temporales ---
$TempPaths = @(
    "$env:TEMP",
    "$env:windir\Temp"
)

foreach ($path in $TempPaths) {
    Write-Host "Limpiando carpeta: $path" -ForegroundColor Cyan
    Remove-Item -Path "$path\*" -Recurse -Force -ErrorAction SilentlyContinue
}

# --- Limpieza de caché de Windows Update ---
Write-Host "Limpiando caché de Windows Update..." -ForegroundColor Cyan
Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:windir\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
Start-Service -Name wuauserv

# --- Limpieza del Liberador de espacio en disco (Cleanmgr) ---
Write-Host "Ejecutando el liberador de espacio en disco (Cleanmgr)..." -ForegroundColor Cyan
cleanmgr /sagerun:1

Write-Host "--- Limpieza finalizada ---" -ForegroundColor Yellow