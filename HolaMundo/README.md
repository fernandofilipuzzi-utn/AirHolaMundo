# 🎯 Proyecto Adobe AIR + Apache Flex Minimalista

Aplicación de escritorio simple que demuestra los fundamentos de Adobe AIR con Apache Flex.

## 📋 Características

- ✅ Aplicación WindowedApplication (desktop)
- ✅ Botón centrado en pantalla
- ✅ Evento click que muestra un Alert
- ✅ Usando solo Apache Flex SDK estándar
- ✅ Sin dependencias externas

## 📁 Estructura del Proyecto

```
prueba/
├── src/
│   ├── Main.mxml              # Aplicación MXML principal
│   └── application.xml        # Descriptor AIR
├── bin/                       # Archivos compilados (generados)
│   ├── Main.swf              # (después de compilar)
│   └── HolaAIR.air           # (opcional - paquete AIR)
├── compilar.bat              # Script para compilar el proyecto
├── ejecutar.bat              # Script para ejecutar la aplicación
├── INSTRUCCIONES.txt         # Instrucciones detalladas
└── README.md                 # Este archivo
```

## 🚀 Inicio Rápido

### 1️⃣ Requisito Previo: Instalar AIR SDK

Descarga el AIR SDK desde: https://airsdk.harman.com/

Luego configura las variables de entorno:
```
AIR_SDK_HOME=C:\ruta\del\AIR_SDK
```

Agrega al PATH:
```
%AIR_SDK_HOME%\bin
```

### 2️⃣ Compilar el Proyecto

**Opción A: Usando el script (recomendado)**
```bash
compilar.bat
```

**Opción B: Comando manual**
```bash
mxmlc -source-path=src -output=bin/Main.swf src/Main.mxml
```

### 3️⃣ Ejecutar la Aplicación

**Opción A: Usando el script**
```bash
ejecutar.bat
```

**Opción B: Comando manual**
```bash
adl src/application.xml bin/
```

## 📄 Descripción de Archivos

### `src/Main.mxml`
Archivo MXML que define la interfaz gráfica:
- Define una `WindowedApplication` para escritorio
- Contiene un `VGroup` que centra el contenido
- Tiene un `Button` que ejecuta una función al hacer click
- La función muestra un `Alert` con el mensaje "Funciona AIR"

### `src/application.xml`
Descriptor AIR que configura:
- ID de la aplicación: `com.example.holaair`
- Versión: `1.0.0`
- Nombre: `Hola AIR`
- Tamaño de ventana: 400x300 píxeles
- Archivo SWF principal: `Main.swf`

## 💡 Cómo Funciona

1. El compilador `mxmlc` traduce `Main.mxml` (código MXML/ActionScript) → `Main.swf` (bytecode Flash)
2. El descriptor `application.xml` configura cómo se ejecuta la aplicación AIR
3. `adl` (Adobe Debug Launcher) carga el archivo AIR y lo ejecuta

## 🔧 Pasos de Compilación Detallados

```bash
# Paso 1: Compilar MXML a SWF
mxmlc -source-path=src -output=bin/Main.swf src/Main.mxml
# Genera: bin/Main.swf (~200KB aprox)

# Paso 2: Ejecutar con ADL
adl src/application.xml bin/
# Abre ventana con la aplicación
```

## ❌ Solución de Problemas

| Problema | Solución |
|----------|----------|
| `mxmlc no se reconoce` | Verifica que AIR SDK esté en PATH |
| `adl no se reconoce` | Verifica que AIR SDK esté en PATH |
| `Error al compilar MXML` | Verifica sintaxis XML en Main.mxml |
| `application.xml no encontrado` | Verifica que esté en `src/` |
| `Main.swf no existe` | Ejecuta `compilar.bat` primero |

## 🎓 Notas Técnicas

- **MXML**: Lenguaje declarativo basado en XML para interfaces gráficas
- **ActionScript 3**: Lenguaje de programación (usado en `<fx:Script>`)
- **WindowedApplication**: Componente para aplicaciones de escritorio AIR
- **VGroup**: Contenedor que ordena componentes verticalmente
- **Alert**: Diálogo emergente (parte de `mx.controls`)

## 📦 Próximos Pasos (Opcional)

### Empaquetar como Instalador .AIR

```bash
adt -package -storetype pkcs12 -keystore michiave.p12 bin/HolaAIR.air src/application.xml bin/Main.swf
```

(Requiere un certificado, ver `INSTRUCCIONES.txt` para generar autofirmado)

## 📚 Referencias

- [Adobe AIR SDK](https://airsdk.harman.com/)
- [Apache Flex](https://flex.apache.org/)
- [MXML Documentation](https://flex.apache.org/asdoc/index.html)

## ⚖️ Licencia

Este proyecto es un ejemplo mínimo para propósitos educativos.

---

**¡Listo!** Ya tienes un proyecto funcional de Adobe AIR con Apache Flex. 🎉
