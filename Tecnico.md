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

```
imprimir_estructura:
		mov DI, offset cod_name
ciclo_poner_dolar_1:
		mov AL, [DI]
		cmp AL, 00
		je poner_dolar_1
		inc DI
		jmp ciclo_poner_dolar_1
poner_dolar_1:
		mov AL, 24  ;; dólar
		mov [DI], AL
		;; imprimir normal
		mov DX, offset cod_prod
		mov AH, 09
		int 21
		mov DX, offset linea_blanco
		mov AH, 09
		int 21

        mov DX, 00
		
		mov DX, offset linea_blanco
		mov AH, 09
		int 21
		ret
```

### Menu principal y distintos submenus 
Tambien tenemo a lo largo del programa, distintos submenus que funcionan para guiar al usuario, estos menus son mostrados con la siguiente interrupcion 
```
mov DX, offset linea_blanco
            mov AH, 09
            int 21 
            mov DX, offset linea_blanco
            mov AH, 09
            int 21 
            mov DX, offset menu
            mov AH, 09
            int 21
            mov DX, offset opc_product
            mov AH, 09
            int 21 
            mov DX, offset opc_ventas
            mov AH, 09
            int 21 
            mov DX, offset opc_herrams
            mov AH, 09
            int 21 
            mov DX, offset opc_salir
            mov AH, 09
            int 21 
```
y para leer el dato ingresado se usa:
```
mov AH, 01
            int 21 
            cmp AL, 70 ;; p minúscula ascii
		    je menu_prods
		    cmp AL, 76 ;; v minúscula ascii
		    ;je menu_ventas 
		    cmp AL, 68 ;; h minúscula ascii
	    	je generar_catalogo
            cmp AL, 73 ;s
            je fin
            jmp menu_principal
```

### Segmento de datos 📚
En el lenguaje ensamblador, el segmento de datos (data segment) es una sección del programa donde se definen y se reservan variables y constantes para su uso durante la ejecución del programa. El segmento de datos almacena información estática que no cambia durante la ejecución del programa.

En los programas escritos en ensamblador, el segmento de datos se declara utilizando la directiva "DATA" o "DATA SEGMENT". Dentro de este segmento, se pueden declarar variables, constantes y arreglos utilizando diferentes directivas de almacenamiento, como "DB" (Define Byte), "DW" (Define Word) o "DD" (Define Doubleword), dependiendo del tamaño de los datos.

Segmento de datos real utilizado en Tiendita.asm 
```
;; VARIABLES | MEMORIA RAM
numero           db   05 dup (30)
usac         db  "Universidad de San Carlos de Guatemala",0a,"$"
facultad     db  "Facultad de Ingenieria",0a,"$"
escuela      db  "Escuela de Vacaciones",0a,"$"
curso        db  "Arquitectura de Computadoras y Ensambladores 1",0a,"$"
nombre       db  "Nombre: Gerhard Benjamin Ardon Valdez",0a,"$"
carne        db  "Carne: 202004796",0a,"$"
err          db  "error :(",0a,"$"
;DATOS DEL MENU ======================
menu         db  "==MENU==",0a,"$"
opc_product  db  "(P)roductos",0a,"$"
opc_ventas   db  "(V)entas",0a,"$"
opc_herrams  db  "(H)erramientas",0a,"$"
opc_salir    db  "(S)alir",0a,"$"
linea_blanco db 0a,"$"
menu_p       db  "==PRODUCTOS==",0a,"$"
opc_crear    db  "(C)rear producto",0a,"$"
opc_mostrar  db  "(M)ostrar producto",0a,"$"
opc_eliminar db  "(E)liminar producto",0a,"$"
;INGRESAR PRODUCTO ====================
prompt_code  db    "Codigo: ","$"
prompt_name  db    "Nombre: ","$"
prompt_price db    "Precio: ","$"
prompt_units db    "Unidades: ","$"

error 		 db    "ups, algo salio mal con el campo ingresado :/","$"
buffer_in   db  20, 00
                 db  20 dup (0)

;; "ESTRUCTURA PRODUCTO"==================
cod_prod    db    05 dup (0)
cod_name    db    21 dup (0)
cod_price   db    05 dup (0)
cod_units   db    05 dup (0)
;; numéricos
num_price   dw    0000
num_units   dw    0000
;;; temps===============================
cod_prod_temp    db    05 dup (0)
puntero_temp     dw    0000
ceros          db     2b  dup (0)
;; archivo productos====================
archivo_prods    db   "PROD.BIN",00
handle_prods     dw   0000
prompt_mostrar  db	"Seguir viendo(q)  /  Salir(ENTER)",0a,"$"
prompt_borrar	db	"Codigo para eliminar producto: $"		
;info de acceso =======================
file_acceso     db  "PRA2.CNF",00
handle_acceso   dw  0000
buffer_linea    db  38 dup(0) 
tkn_creds       db  "[credenciales]",0d,0a,'usuario = "gvaldez"',0d,0a,'clave = "202004796"'
;;archivo catalogo=======================
nombre_rep1      db   "CATALG.HTM",00
handle_reps      dw   0000
tam_encabezado_html    db     0c
encabezado_html        db     "<html><body>"
tam_inicializacion_tabla   db   5e
inicializacion_tabla   db     '<table border="1"><tr><td>codigo</td><td>descripcion</td><td>precio</td><td>unidades</td></tr>'
tam_cierre_tabla       db     8
cierre_tabla           db     "</table>"
tam_footer_html        db     0e
footer_html            db     "</body></html>"
td_html                db     "<td>"
tdc_html               db     "</td>"
tr_html                db     "<tr>"
trc_html               db     "</tr>"
dateBuffer db 12 dup (1)

```


