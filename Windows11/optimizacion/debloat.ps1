# ⚡ debloat.ps1
# Elimina bloatware y aplicaciones innecesarias de Windows 11.
# Ejecutar como Administrador.

Write-Host "--- Inicio del script de Debloat ---" -ForegroundColor Yellow

# --- Lista de aplicaciones a eliminar ---
# Puedes añadir o quitar aplicaciones de esta lista según tus necesidades.
# Para encontrar el nombre de otras apps, usa el comando: Get-AppxPackage | Select Name
$bloatware = @(
    "*Microsoft.549981C3F5F10*"           # Cortana
    "*Microsoft.Advertising.Xaml*"       # Microsoft Advertising SDK
    "*Microsoft.BingNews*"               # Noticias
    "*Microsoft.BingWeather*"            # El Tiempo
    "*Microsoft.GetHelp*"                # Obtener Ayuda
    "*Microsoft.Getstarted*"             # Introducción
    "*Microsoft.HEIFImageExtension*"     # Extensión de imagen HEIF
    "*Microsoft.Messaging*"              # Mensajería de Microsoft
    "*Microsoft.Microsoft3DViewer*"      # Visor 3D
    "*Microsoft.MicrosoftOfficeHub*"     # Office Hub
    "*Microsoft.MicrosoftSolitaireCollection*" # Solitaire Collection
    "*Microsoft.MixedReality.Portal*"    # Portal de Realidad Mixta
    "*Microsoft.Office.OneNote*"         # OneNote (versión UWP)
    "*Microsoft.People*"                 # Contactos
    "*Microsoft.PowerAutomateDesktop*"   # Power Automate
    "*Microsoft.Print3D*"                # Print 3D
    "*Microsoft.ScreenSketch*"           # Recorte y Anotación
    "*Microsoft.SkypeApp*"               # Skype
    "*Microsoft.StorePurchaseApp*"       # App de compra de la Store
    "*Microsoft.Todos*"                  # Microsoft To Do
    "*Microsoft.Wallet*"                 # Cartera de Microsoft
    "*Microsoft.WebMediaExtensions*"     # Extensiones multimedia web
    "*Microsoft.WebpImageExtension*"     # Extensión de imagen WebP
    "*Microsoft.WindowsAlarms*"          # Alarmas y Reloj
    "*Microsoft.WindowsCamera*"          # Cámara
    "*Microsoft.WindowsCommunicationsApps*" # Correo y Calendario

    "*Microsoft.WindowsFeedbackHub*"     # Centro de opiniones
    "*Microsoft.WindowsMaps*"            # Mapas de Windows
    "*Microsoft.WindowsSoundRecorder*"   # Grabadora de Voz
    "*Microsoft.YourPhone*"              # Enlace Móvil (Phone Link)
    "*Microsoft.ZuneMusic*"              # Groove Music
    "*Microsoft.ZuneVideo*"              # Películas y TV
    "*Clipchamp.Clipchamp*"              # Clipchamp Video Editor
    "*EclipseManager*"                   # Dev Home
    "*Teams*"                            # Microsoft Teams (personal)
)

Write-Host "Se intentarán eliminar las siguientes aplicaciones:" -ForegroundColor Cyan
$bloatware | ForEach-Object { Write-Host "- $_" }

# --- Bucle para desinstalar las aplicaciones ---
foreach ($app in $bloatware) {
    Write-Host "Intentando eliminar: $app" -ForegroundColor Green
    Get-AppxPackage -AllUsers $app | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Where-Object { $_.PackageName -like $app } | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
}

Write-Host "--- Proceso de Debloat finalizado ---" -ForegroundColor Yellow