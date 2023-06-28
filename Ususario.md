# Manual Usuario Tiendita en ASM 🍱
![Máquina expendedora de snacks](https://img.freepik.com/vector-premium/maquina-expendedora-snack-crackers-comida-chatarra-bebidas-gaseosas-saling-venta-automatica-coleccion-dibujos-animados_80590-7141.jpg?w=2000)

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

## Introducción
La aplicación de Gestión es una herramienta diseñada para administrar productos, realizar ventas y generar informes. Este manual proporciona una guía detallada sobre cómo utilizar todas las funcionalidades de la aplicación.

### Requisitos del sistema
Sistema operativo: Windows 10 o posterior.

## Inicio de sesión
para el inicio de sesion recomiendo tener un archivo con sus credenciales 

### Gestión de productos
En esta sección, puedes realizar las siguientes acciones:

### Agregar producto: Haz clic en el botón "Agregar producto" y completa el formulario con la información del producto (nombre, precio, descripción, etc.). Luego, presiona el botón "Guardar" para agregar el producto a la base de datos.
### Eliminar producto: Busca el producto que deseas eliminar y haz clic en el botón "Eliminar". Confirmar la acción en el cuadro de diálogo que aparece.
### Mostrar productos: Se mostrará una lista de todos los productos disponibles con detalles como el nombre, precio y cantidad.
Realizar ventas
En esta sección, puedes llevar a cabo las siguientes acciones:

### Agregar venta: Haz clic en  "Agregar venta" y selecciona los productos que el cliente desea comprar. Ingresa la cantidad y confirma la venta. El inventario se actualizará automáticamente.
Ver ventas: Podrás ver un historial de todas las ventas realizadas, incluyendo detalles como la fecha, el cliente, los productos y el monto total.
### Reportes
La sección de reportes te permite generar informes sobre las ventas y el inventario. Puedes generar los siguientes tipos de informes:



## Descripción de la maquina🖥
La máquina expendedora es un dispositivo electrónico que permite a los usuarios seleccionar productos, realizar pagos y recibir los productos elegidos. Además, esta máquina está equipada con características adicionales que le permiten a los usuarios personalizar su experiencia de compra y a los operadores de la máquina administrar y mantener el sistema.
### Seleccion🔀
En términos de selección de productos, la máquina expendedora tiene una pantalla táctil que muestra una lista de productos disponibles. Los usuarios pueden navegar por la lista de productos y seleccionar el que desean comprar. Para facilitar la navegación, los productos se organizan en categorías, y los usuarios pueden usar un teclado virtual para buscar un producto específico por nombre o por código de barras.

La máquina también permite a los usuarios cambiar los productos que desean comprar. Si un usuario selecciona un producto por error, puede cancelar el pedido y seleccionar otro producto en su lugar. También es posible cambiar la cantidad de un producto seleccionado.

### Administracion 🗒🗒
En cuanto a la administración de la máquina, los operadores pueden acceder a una interfaz de administración que les permite agregar nuevos productos, cambiar los precios de los productos existentes y ver informes de ventas y estadísticas. También pueden agregar nuevos usuarios y controlar los niveles de acceso para garantizar la seguridad y la privacidad de los datos.
### Loguear🙍‍♂️
La máquina expendedora también tiene una función de inicio de sesión que permite a los usuarios registrados guardar su información personal y preferencias de compra. Cuando un usuario inicia sesión, puede acceder a su historial de compras, guardar su método de pago preferido y recibir recomendaciones de productos basadas en sus compras anteriores.

En resumen, la máquina expendedora es una solución de venta al por menor que ofrece a los usuarios una experiencia personalizada y fácil de usar mientras que los operadores pueden administrar el sistema de manera eficiente y efectiva.

## Requisitos del sistema 🖥
Para descargar una aplicación creada en App Inventor y poder instalarla en tu dispositivo Android, necesitas cumplir con los siguientes requisitos:

Tener un dispositivo Android: Para poder descargar e instalar una aplicación creada en App Inventor, necesitas tener un dispositivo Android que tenga al menos la versión 4.0.3 (Ice Cream Sandwich) del sistema operativo Android.

Permitir la instalación de aplicaciones de origen desconocido: Por defecto, Android no permite la instalación de aplicaciones que no provengan de la tienda oficial de Google Play. Para instalar una aplicación creada en App Inventor, necesitas habilitar la opción de "Fuentes desconocidas" en la sección de Seguridad de la configuración de tu dispositivo.

Descargar el archivo APK: Una vez que hayas creado la aplicación en App Inventor, necesitas exportarla como un archivo APK. Este archivo es el que se usa para instalar la aplicación en tu dispositivo Android. Puedes descargar el archivo APK directamente desde App Inventor o guardarlo en tu Google Drive para descargarlo desde tu dispositivo Android.

Tener suficiente espacio de almacenamiento: Para instalar una aplicación creada en App Inventor, necesitas tener suficiente espacio de almacenamiento disponible en tu dispositivo Android. El tamaño de la aplicación dependerá de la cantidad de elementos multimedia que contenga, como imágenes, sonidos y videos.

En general, los requisitos para descargar una aplicación creada en App Inventor son bastante simples. Solo necesitas tener un dispositivo Android, permitir la instalación de aplicaciones de origen desconocido, descargar el archivo APK y tener suficiente espacio de almacenamiento. Una vez que tengas todo esto, puedes instalar la aplicación en tu dispositivo y empezar a usarla.

### Funcionamiento y flujo de trabajo 📱
#### Inicio de sesión
El inicio de sesión se podrá realizar una vez el dispositivo y el sistema estén vinculados por medio de Bluetooth. En el panel de operación se ingresará el Apodo del usuario y su Contraseña, si estos coinciden con los de algún registro, el sistema generará un token que será mostrado en la aplicación móvil. El usuario deberá ingresar el token que se le brindó al sistema por medio del panel de operación, si el token coincide con el generado se dará acceso al sistema. De lo contrario se permitirán dos intentos más. En el caso en que el token ingresado no coincida después de los intentos disponibles se volverá a la pantalla de Inicio y no permitirá ninguna acción por 10 segundos. Luego de este tiempo el usuario podrá volver a intentar ingresar.

#### Escoger producto
Con los botones se podra seleccionar el producto y tambien escoger el seleccionado usando los motores, media vez haya existencia en la maquina expendedora

