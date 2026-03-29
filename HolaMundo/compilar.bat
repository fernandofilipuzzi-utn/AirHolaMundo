@echo off
REM Script de compilación para Adobe AIR + Apache Flex
REM Requiere tener AIR SDK instalado y en el PATH

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║  COMPILANDO MXML A SWF CON APACHE FLEX                    ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Verificar que mxmlc está disponible
where mxmlc >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ ERROR: mxmlc no se encuentra en el PATH
    echo.
    echo Asegúrate de:
    echo 1. Descargar AIR SDK desde https://airsdk.harman.com/
    echo 2. Establecer variable: set AIR_SDK_HOME=ruta\del\air\sdk
    echo 3. Agregar a PATH: %AIR_SDK_HOME%\bin
    echo.
    pause
    exit /b 1
)

REM Crear carpeta bin si no existe
if not exist bin (
    mkdir bin
    echo 📁 Carpeta 'bin' creada
)

REM Compilar Main.mxml
echo.
echo 🔨 Compilando Main.mxml...
echo Comando: mxmlc -source-path=src -output=bin/Main.swf src/Main.mxml
echo.

mxmlc -compiler.define CONFIG::TESTING false -compiler.define CONFIG::release true -source-path=src -output=bin/Main.swf src/Main.mxml

if %errorlevel% equ 0 (
    echo.
    echo ✅ ¡Compilación exitosa!
    echo 📄 Archivo generado: bin\Main.swf
    echo.
    echo Próximo paso: Ejecuta "ejecutar.bat" o usa:
    echo   adl src/application.xml bin/
) else (
    echo.
    echo ❌ Error durante la compilación
    echo Verifica los mensajes de error arriba
)

echo.
pause
