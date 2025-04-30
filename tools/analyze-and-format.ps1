Write-Host "🔧 Formateando código..."
dart format --line-length 80 --set-exit-if-changed lib test
if ($LASTEXITCODE -gt 1) {
    Write-Error "Error al formatear el código."
    exit $LASTEXITCODE
}

Write-Host "🔍 Ejecutando análisis estático..."
flutter analyze lib test
if ($LASTEXITCODE -ne 0) {
    Write-Error "El análisis estático encontró errores."
    exit $LASTEXITCODE
}

exit 0
