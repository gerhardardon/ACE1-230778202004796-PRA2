.MODEL SMALL
.RADIX 16
.STACK  ;segmento pila-----------------------------------------
.DATA   ;segmento datos----------------------------------------

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
.CODE   ;segmento codigo---------------------------------------
.STARTUP
inicio: ;inicio codigo
            ;ENCABEZADO
            mov DX, offset usac
            mov AH, 09
            int 21 
            mov DX, offset facultad
            mov AH, 09
            int 21 
            mov DX, offset escuela
            mov AH, 09
            int 21 
            mov DX, offset curso
            mov AH, 09
            int 21 
            mov DX, offset nombre
            mov AH, 09
            int 21
            mov DX, offset carne
            mov AH, 09
            int 21
            mov DX, 0
abrir_acceso:
            mov AH, 00 ;limpiamos AX
            mov AL, 00
		    mov AH, 3d
            mov AL, 02
		    mov DX, offset file_acceso
		    int 21
            jc mensaje_err ;si no lo abre
            jmp leer_acceso ;si lo abre sigue
mensaje_err: 
            mov DX, offset err
            mov AH, 09
            int 21
            jmp fin
leer_acceso:
            mov [handle_acceso], AX 
            mov DI, offset buffer_linea
            mov AH, 3f
            mov BX, [handle_acceso]
            mov CX, 38
            mov DX, DI
            int 21  ;se deben comparar las cadenas de string

            mov SI, offset tkn_creds
            mov DI, offset buffer_linea
            call cadenas_iguales ;llama proc
            cmp DL, 00
            je mensaje_err ;si son distintos finaliza, hasta aca todo bien
            jmp menu_principal

menu_principal:
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

menu_prods:
            mov DX, offset linea_blanco
            mov AH, 09
            int 21
            mov DX, offset menu_p
            mov AH, 09
            int 21
            mov DX, offset opc_crear
            mov AH, 09
            int 21
            mov DX, offset opc_eliminar
            mov AH, 09
            int 21
            mov DX, offset opc_mostrar
            mov AH, 09
            int 21
            mov DX, offset opc_salir
            mov AH, 09
            int 21

            mov AH, 01
            int 21 
            cmp AL, 63 ;c
            je ingresar_codigo
            cmp AL, 65 ;e
			je eliminar_prods
            cmp AL, 6d ;m
            je mostrar_prods
            cmp AL, 73 ;s
            je menu_principal
            jmp fin

ingresar_codigo: ;ingresar codigo de Nuevo Prod
            mov DX, offset prompt_code
            mov AH, 09
            int 21

            mov DX, offset buffer_in
		    mov AH, 0a
		    int 21
		    mov DI, offset buffer_in
		    inc DI
		    mov AL, [DI]

		    cmp AL, 00 ;si el largo es 0
		    je  ingresar_codigo
		    cmp AL, 05 ;si el largo es >5
		    ja ingresar_codigo

            ;tenemos que guardar el codigo    
            mov SI, offset cod_prod
    		mov DI, offset buffer_in
	    	inc DI
		    mov CH, 00 ;limpiamos ch
		    mov CL, [DI] ;tenemos el numero de veces que repetimos loop
            inc DI  ;; me posiciono en el contenido del buffer
copiar_codigo:	
        mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_codigo  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset linea_blanco
		mov AH, 09
		int 21  
 
ingresar_nombre: ;ingresar nombre de Nuevo Prod
            mov DX, offset prompt_name
            mov AH, 09
            int 21

            mov DX, offset buffer_in
		    mov AH, 0a
		    int 21
		    mov DI, offset buffer_in
		    inc DI
		    mov AL, [DI]

		    cmp AL, 00 ;si el largo es 0
		    je  ingresar_nombre
		    cmp AL, 20 ;si el largo es >5
		    ja ingresar_nombre

            ;tenemos que guardar el name    
            mov SI, offset cod_name
    		mov DI, offset buffer_in
	    	inc DI
		    mov CH, 00 ;limpiamos ch
		    mov CL, [DI] ;tenemos el numero de veces que repetimos loop
            inc DI  ;; me posiciono en el contenido del buffer
copiar_nombre:	
        mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_nombre  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset linea_blanco
		mov AH, 09
		int 21  

ingresar_precio: ;ingresar nombre de Nuevo Prod
			mov DI, offset cod_price
			mov CX, 0005
			call memset

            mov DX, offset prompt_price
            mov AH, 09
            int 21

            mov DX, offset buffer_in
		    mov AH, 0a
		    int 21
		    mov DI, offset buffer_in
		    inc DI
		    mov AL, [DI]

			
		    cmp AL, 00 ;si el largo es 0
		    je  ingresar_precio
		    cmp AL, 20 ;si el largo es >5
		    ja ingresar_precio


guardar_prec:		            ;tenemos que guardar el name    
            mov SI, offset cod_price
    		mov DI, offset buffer_in
	    	inc DI
		    mov CH, 00 ;limpiamos ch
		    mov CL, [DI] ;tenemos el numero de veces que repetimos loop
            inc DI  ;; me posiciono en el contenido del buffer
copiar_precio:	
        mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI	

		loop copiar_precio ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset linea_blanco
		mov AH, 09
		int 21  

        mov DI, offset cod_price
		call cadenaAnum
		;; AX -> numero convertido
		mov [num_price], AX
		;;
		mov DI, offset cod_price
		mov CX, 0005
		call memset
ingresar_unidades: ;ingresar nombre de Nuevo Prod
            mov DX, offset prompt_units
            mov AH, 09
            int 21

            mov DX, offset buffer_in
		    mov AH, 0a
		    int 21
		    mov DI, offset buffer_in
		    inc DI
		    mov AL, [DI]

		    cmp AL, 00 ;si el largo es 0
		    je  ingresar_unidades
		    cmp AL, 20 ;si el largo es >5
		    ja ingresar_unidades

            ;tenemos que guardar el name    
            mov SI, offset cod_units
    		mov DI, offset buffer_in
	    	inc DI
		    mov CH, 00 ;limpiamos ch
		    mov CL, [DI] ;tenemos el numero de veces que repetimos loop
            inc DI  ;; me posiciono en el contenido del buffer
copiar_unidades:	
        mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_unidades  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset linea_blanco
		mov AH, 09
		int 21  

        mov DI, offset cod_units
		call cadenaAnum
		;; AX -> numero convertido
		mov [num_units], AX
		;;
		mov DI, offset cod_units
		mov CX, 0005
		call memset

        ;; GUARDAR EN ARCHIVO==============
abrir_archivo_prod:
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_prods
		int 21
		;; si no lo cremos
		jc  crear_archivo_prod
		;; si abre escribimos
		jmp guardar_handle_prod
crear_archivo_prod:
		mov CX, 0000
		mov DX, offset archivo_prods
		mov AH, 3c
		int 21
		jmp abrir_archivo_prod
guardar_handle_prod:
        ;; guardamos handle
		mov [handle_prods], AX
		;; obtener handle
		mov BX, [handle_prods]
		;; vamos al final del archivo
		mov CX, 00
		mov DX, 00
		mov AL, 02
		mov AH, 42
		int 21

        ;; escribir el producto en el archivo
		;; escribí los dos primeros campos
		mov CX, 26
		mov DX, offset cod_prod
		mov AH, 40
		int 21
		;; escribo los otros dos
		mov CX, 0004
		mov DX, offset num_price
		mov AH, 40
		int 21
		;; cerrar archivo
		mov AH, 3e
		int 21

		mov DI, offset cod_prod
		mov CX, 0005
		call memset

		mov DI, offset cod_name
		mov CX, 0021
		call memset

		jmp menu_prods

mostrar_prods:
       mov DX, offset linea_blanco
		mov AH, 09
		int 21
		;;
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_prods
		int 21
		;;
		mov [handle_prods], AX
		;; leemos
		mov SI, 05
ciclo_mostrar:
		;; puntero cierta posición
		mov BX, [handle_prods]
		mov CX, 0026     ;; leer 26h bytes
		mov DX, offset cod_prod
		;;
		mov AH, 3f
		int 21
		;; puntero avanzó
		mov BX, [handle_prods]
		mov CX, 0004
		mov DX, offset num_price
		mov AH, 3f
		int 21
		
		;; ¿cuántos bytes leímos?
		;; si se leyeron 0 bytes entonces se terminó el archivo...
		cmp AX, 0000
		je fin_mostrar
		;; ver si es producto válido
		mov AL, 00
		cmp [cod_prod], AL
		je ciclo_mostrar
		;; producto en estructura
		call imprimir_estructura
		dec SI
		cmp SI, 00
		je seguir_viendo
		jmp ciclo_mostrar
		;;
fin_mostrar:
		mov AH, 3e
		int 21
		jmp menu_prods
seguir_viendo:
		mov SI, 05
		mov DX, offset prompt_mostrar
        mov AH, 09
        int 21
		
		mov AH, 08
		int 21 
		cmp AL, 71
		je ciclo_mostrar
		cmp AL, 0d
		je menu_prods
		jmp seguir_viendo

eliminar_prods:
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_prods
		int 21 ;abrimos 
		;;
		mov [handle_prods], AX 

eliminar_producto_archivo:
		mov DX, 0000
		mov [puntero_temp], DX
pedir_de_nuevo_codigo2:
		mov DX, offset prompt_code
		mov AH, 09
		int 21
		mov DX, offset buffer_in
		mov AH, 0a
		int 21
		;;
		mov DI, offset buffer_in
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_codigo2
		cmp AL, 05
		jb  aceptar_tam_cod2  ;; jb --> jump if below
		mov DX, offset linea_blanco
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_codigo2
		;;; mover al campo codigo en la estructura producto
aceptar_tam_cod2:
		mov SI, offset cod_prod_temp
		mov DI, offset buffer_in
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_codigo2:	mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_codigo2  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset linea_blanco
		mov AH, 09
		int 21
		;;
		mov AL, 02              ;;;<<<<<  lectura/escritura
		mov DX, offset archivo_prods
		mov AH, 3d
		int 21
		mov [handle_prods], AX
		;;; TODO: revisar si existe
ciclo_encontrar:
		int 03
		mov BX, [handle_prods]
		mov CX, 26
		mov DX, offset cod_prod
		moV AH, 3f
		int 21
		mov BX, [handle_prods]
		mov CX, 4
		mov DX, offset num_price
		moV AH, 3f
		int 21
		cmp AX, 0000   ;; se acaba cuando el archivo se termina
		je finalizar_borrar
		mov DX, [puntero_temp]
		add DX, 2a
		mov [puntero_temp], DX
		;;; verificar si es producto válido
		mov AL, 00
		cmp [cod_prod], AL
		je ciclo_encontrar
		;;; verificar el código
		mov SI, offset cod_prod_temp
		mov DI, offset cod_prod
		mov CX, 0005
		call cadenas_iguales
		;;;; <<
		cmp DL, 0ff
		je borrar_encontrado
		jmp ciclo_encontrar
borrar_encontrado:
		mov DX, [puntero_temp]
		sub DX, 2a
		mov CX, 0000
		mov BX, [handle_prods]
		mov AL, 00
		mov AH, 42
		int 21
		;;; puntero posicionado
		mov CX, 2a
		mov DX, offset ceros
		mov AH, 40
		int 21
		mov BX, [handle_prods]
		mov AH, 3e
		int 21
		jmp menu_prods
finalizar_borrar:
		mov DX, offset error
        mov AH, 09
        int 21
		mov DX, offset linea_blanco
        mov AH, 09
        int 21
		mov BX, [handle_prods]
		mov AH, 3e
		int 21
		jmp menu_prods

generar_catalogo:
		mov AH, 3c
		mov CX, 0000
		mov DX, offset nombre_rep1
		int 21
		mov [handle_reps], AX
		mov BX, AX
		mov AH, 40
		mov CH, 00
		mov CL, [tam_encabezado_html]
		mov DX, offset encabezado_html
		int 21
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_inicializacion_tabla]
		mov DX, offset inicializacion_tabla
		int 21
		;;
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_prods
		int 21
		;;
		mov [handle_prods], AX
		;; leemos
ciclo_mostrar_rep1:
		;; puntero cierta posición
		mov BX, [handle_prods]
		mov CX, 26     ;; leer 26h bytes
		mov DX, offset cod_prod
		;;
		mov AH, 3f
		int 21
		;; puntero avanzó
		mov BX, [handle_prods]
		mov CX, 0004
		mov DX, offset num_price
		mov AH, 3f
		int 21
		;; ¿cuántos bytes leímos?
		;; si se leyeron 0 bytes entonces se terminó el archivo...
		cmp AX, 00
		je fin_mostrar
		;; ver si es producto válido
		mov AL, 00
		cmp [cod_prod], AL
		je ciclo_mostrar_rep1
		;; producto en estructura
		call imprimir_estructura_html
		jmp ciclo_mostrar_rep1
		;;
fin_mostrar_rep1:
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_cierre_tabla]
		mov DX, offset cierre_tabla
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_footer_html]
		mov DX, offset footer_html
		int 21
		;;
		; Obtener la fecha actual
        mov AH, 2A
        int 21h

        ; Guardar la fecha en el búfer
        mov SI, offset dateBuffer
        movsb ; Copiar el año
        movsb ; Copiar el mes
        movsb ; Copiar el día

        ; Escribir la fecha en el archivo
        mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 12
		mov DX, offset dateBuffer
		int 21
		;;
		
		;;
		mov AH, 3e
		int 21
		jmp menu_principal


;;; ENTRADA:
;;    BX -> handle
imprimir_estructura_html:
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
		;;
		mov DX, offset cod_prod ;manda a escribir
		mov SI, 0000
ciclo_escribir_codigo:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je escribir_desc
		cmp SI, 0006 ;compara tamaños
		je escribir_desc
		mov CX, 0001
		mov BX, [handle_reps]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribir_codigo
escribir_desc:
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21

		

		;;
		mov DX, offset cod_name
		mov SI, 0000
ciclo_escribir_desc:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je cerrar_tags
		cmp SI, 0026
		je cerrar_tags
		mov CX, 0001
		mov BX, [handle_reps]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribir_desc
		;;
cerrar_tags:
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
		;; CON ESTO IMPRIME PRECIO
		mov AX, [num_price]  
		call numAcadena
		;; [numero] tengo la cadena convertida
		mov BX, [handle_reps]
		mov CH, 00
		mov CL, 0005
		mov DX, offset numero
		mov AH, 40
		int 21
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
		;; CON ESTO IMPRIME PRECIO
		mov AX, [num_units]  
		call numAcadena
		;; [numero] tengo la cadena convertida
		mov BX, [handle_reps]
		mov CH, 00
		mov CL, 0005
		mov DX, offset numero
		mov AH, 40
		int 21
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
		;;
		ret
;; cadenas_iguales -
;; ENTRADA:
;;    SI -> dirección a cadena 1
;;    DI -> dirección a cadena 2
;;    CX -> tamaño máximo
;; SALIDA:
;;    DL -> 00 si no son iguales

;;         0ff si si lo son
cadenas_iguales:
ciclo_cadenas_iguales:
		mov AL, [SI]
		cmp [DI], AL
		jne no_son_iguales
		inc DI
		inc SI
		loop ciclo_cadenas_iguales
		;;;;; <<<
		mov DL, 0ff
		ret
no_son_iguales:	mov DL, 00
		ret

;; memset
;; ENTRADA:
;;    DI -> dirección de la cadena
;;    CX -> tamaño de la cadena
memset:
ciclo_memset:
		mov AL, 00
		mov [DI], AL
		inc DI
		loop ciclo_memset
		ret

;; cadenaAnum
;; ENTRADA:
;;    DI -> dirección a una cadena numérica
;; SALIDA:
;;    AX -> número convertido
;
;
;
;;[31][32][33][00][00]
;;     ^
;;     |
;;     ----- DI
;;;;
;;AX = 0
;;10 * AX + *1*  = 1
;;;;
;;AX = 1
;;10 * AX + 2  = 12
;;;;
;;AX = 12
;;10 * AX + 3  = 123
;;;;
cadenaAnum:
		mov AX, 0000    ; inicializar la salida
		mov CX, 0005    ; inicializar contador
		;;
seguir_convirtiendo:
		mov BL, [DI]
		cmp BL, 00
		je retorno_cadenaAnum
		sub BL, 30      ; BL es el valor numérico del caracter
		mov DX, 000a
		mul DX          ; AX * DX -> DX:AX
		mov BH, 00
		add AX, BX 
		inc DI          ; puntero en la cadena
		loop seguir_convirtiendo
retorno_cadenaAnum:
		ret

;; numAcadena
;; ENTRADA:
;;     AX -> número a convertir    
;; SALIDA:
;;    [numero] -> numero convertido en cadena
;;AX = 1500
;;CX = AX  <<<<<<<<<<<
;;[31][30][30][30][30]
;;                  ^
numAcadena:
		mov CX, 0005
		mov DI, offset numero
ciclo_poner30s:
		mov BL, 30
		mov [DI], BL
		inc DI
		loop ciclo_poner30s
		;; tenemos '0' en toda la cadena
		mov CX, AX    ; inicializar contador
		mov DI, offset numero
		add DI, 0004
		;;
ciclo_convertirAcadena:
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a
		je aumentar_siguiente_digito_primera_vez
		loop ciclo_convertirAcadena
		jmp retorno_convertirAcadena
aumentar_siguiente_digito_primera_vez:
		push DI
aumentar_siguiente_digito:
		mov BL, 30     ; poner en '0' el actual
		mov [DI], BL
		dec DI         ; puntero a la cadena
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a
		je aumentar_siguiente_digito
		pop DI         ; se recupera DI
		loop ciclo_convertirAcadena
retorno_convertirAcadena:
		ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; imprimir_estructura - ...
;; ENTRADAS:
;; SALIDAS:
;;     o Impresión de estructura
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
fin:    ;fin de codigo
.EXIT
END