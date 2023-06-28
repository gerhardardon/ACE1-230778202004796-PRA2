# Manual Tecnico de Tiendita en ASM 🥫
## Descripción del sistema
El siguiente documento tiene como proposito la explicacion del funcionamiento de un programa realizado para el fucionamiento, 
manejo y orden de una tiendita con las siguientes caracteristicas:

- Manejo de Productos
- Manejo de ventas 
- Manejo de Reportes 

El programa se realizó utilizando MASM 6.11 y el emulador DosBox para poder compilar el mismo, a continuacion un [enlace para la instalacion
de markdown en Windows 10](https://www.youtube.com/watch?v=nrmz66Qe8R0) 
Ademas de esto se utilizó como apollo el documento de interrupciones para masm proporcionado en el laboratorio, una tabla de caracteres acii en hexadecimal y jun listado de jmp 

## Requisitos minimos ‼‼ 
El ensamblador MASM 6.11, lanzado por Microsoft en 1993, es compatible con sistemas operativos de la época, como MS-DOS y versiones antiguas de Windows. A continuación se detallan los requisitos mínimos típicos para ejecutar programas creados con MASM 6.11:

### Sistema operativo 🖥

- MS-DOS 3.0 o posterior.
- Windows 3.x (por ejemplo, Windows 3.1).
### Hardware:

Procesador Intel 80386 o posterior. MASM 6.11 no es compatible con procesadores más nuevos como los de la serie Intel Pentium.
Se recomienda un mínimo de 4 MB de RAM (aunque MASM 6.11 puede funcionar con menos).
🛑Ten en cuenta que MASM 6.11 es una versión antigua del ensamblador y no es compatible con sistemas operativos modernos, como Windows 10. Si estás utilizando un sistema operativo más reciente, es posible que debas considerar el uso de versiones más recientes del ensamblador MASM, como MASM 6.15 o MASM32, que son compatibles con sistemas operativos modernos y ofrecen características y mejoras adicionales🛑

## Subrutinas usadas 🔎🔎
se utilizaron diferentes subrutinas en el programa tales como 
- cadenas_iguales: la cual fue utilizada para comparar cadenas 
- memset: utilizada para limpiar memoria
- cadenaAnum: converir los numeros en hex a numero binarios
- numAcadena: el proceso anterior en reversa 
- imprimir_estructura: imprime en el archivo las cadenas en los registros 

'''
'''

