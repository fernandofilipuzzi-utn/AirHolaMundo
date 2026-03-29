@echo off
REM Script para ejecutar la aplicación AIR con ADL (Adobe Debug Launcher)

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║  EJECUTANDO APLICACION CON ADOBE DEBUG LAUNCHER           ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Verificar que Main.swf existe
if not exist bin\Main.swf (
    echo ❌ ERROR: bin\Main.swf no existe
    echo.
    echo Primero debes compilar el proyecto:
    echo   - Ejecuta "compilar.bat"
    echo   O manualmente:
    echo   - mxmlc -source-path=src -output=bin/Main.swf src/Main.mxml
    echo.
    pause
    exit /b 1
)

REM Verificar que adl está disponible
where adl >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ ERROR: adl no se encuentra en el PATH
    echo.
    echo Asegúrate de:
    echo 1. Descargar AIR SDK desde https://airsdk.harman.com/
    echo 2. Establecer variable: set AIR_SDK_HOME=ruta\del\air\sdk
    echo 3. Agregar a PATH: %AIR_SDK_HOME%\bin
    echo.
    pause
    exit /b 1
)

REM Ejecutar la aplicación
echo.
echo 🚀 Iniciando aplicación...
echo Comando: adl src/application.xml bin/
echo.
echo Presiona Ctrl+C para cerrar la aplicación
echo.

adl src/application.xml bin/

if %errorlevel% equ 0 (
    echo.
    echo ✅ Aplicación ejecutada sin errores
) else (
    echo.
    echo ⚠️  La aplicación finalizó con código: %errorlevel%
)

echo.
