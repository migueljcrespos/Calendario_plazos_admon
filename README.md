# Calculadora de plazos administrativos, en días, para la Junta de Andalucía
Su función es calcular los plazos administrativos para la Junta de Andalucía en días hábiles.
Usa calendario de festivos de varios municipios. Incluye los municipios, capitales de provincia, de Almería, Cádiz, Córdoba, Granada, Huelva, Jaén, Málaga y Sevilla.

> **Calculadora de plazo NO oficial de la Junta de Andalucía**

## Funciones:
- **Calcular plazo en días hábiles.**
    - Indicar la fecha del registro, resolución, notifición, firma o similar.
    - Indicar los días hábiles del plazo.
    - Seleccionar, en el desplegable, el municipio para usar su calendario.
    - *Muestra como resultado el día del vencimiento del plazo.*
- **Calcular días hábiles transcurridos entre 2 fechas.**
    - Indicar el primer día.
    - Indicar el último día.
    - Seleccionar, en el desplegable, el municipio para usar su calendario.
    - *Muestra como resultado los días hábiles transcurridos entre las dos fechas.*
- **Calcular días naturales transcurridos entre 2 fechas.**
    - Indicar el primer día.
    - Indicar el último día.
    - Seleccionar, en el desplegable, el municipio para usar su calendario.
    - *Muestra como resultado los días naturales transcurridos entre las dos fechas.*

## Características técnicas:
- **Lenguaje de programación:**
    - R.
    - Librería: shiny, tidyverse, lubridate, bizdays, readxl.
- **Entorno:**
    - Ejecutable desde RStudio. Ejecutando shiny.
- **Composición:**
    - Está programado para usar calendarios entre 2000 y 2050. Para usar otro calendario hay que modificar el códgo.
    - Se deben incluir los días festivos de cada municipio por medio de un archivo Excel externo.
    - Posee un archivo Excel para listar los días festivos de cada municipio. Cada columna es el listado de los días festivos de cada municipio. Actualmente están los días festivos de 2023, 2024 y 2025. El uso de un archivo Excel externo permite actualizar los días festivos de los próximos años sin modificar el código

 ## Licencia:
 Creative Commons Zero v1.0 Universal

 ## Colaborativa:
 Animamos a la Comunidad para que mejore el código y nos ayude a mejorarlo.
 
