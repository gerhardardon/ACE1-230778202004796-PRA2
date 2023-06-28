# Manual Usuario Tiendita en ASM 🍱
![Máquina expendedora de snacks](https://img.freepik.com/vector-premium/maquina-expendedora-snack-crackers-comida-chatarra-bebidas-gaseosas-saling-venta-automatica-coleccion-dibujos-animados_80590-7141.jpg?w=2000)

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

![Máquina expendedora de snacks](http://appinventor.mit.edu/explore/sites/explore.appinventor.mit.edu/files/ai-bee-logo.png)

### Funcionamiento y flujo de trabajo 📱
#### Inicio de sesión
El inicio de sesión se podrá realizar una vez el dispositivo y el sistema estén vinculados por medio de Bluetooth. En el panel de operación se ingresará el Apodo del usuario y su Contraseña, si estos coinciden con los de algún registro, el sistema generará un token que será mostrado en la aplicación móvil. El usuario deberá ingresar el token que se le brindó al sistema por medio del panel de operación, si el token coincide con el generado se dará acceso al sistema. De lo contrario se permitirán dos intentos más. En el caso en que el token ingresado no coincida después de los intentos disponibles se volverá a la pantalla de Inicio y no permitirá ninguna acción por 10 segundos. Luego de este tiempo el usuario podrá volver a intentar ingresar.

#### Escoger producto
Con los botones se podra seleccionar el producto y tambien escoger el seleccionado usando los motores, media vez haya existencia en la maquina expendedora

