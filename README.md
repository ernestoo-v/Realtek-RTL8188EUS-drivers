Instalador y Configuración del Driver Realtek RTL8188EUS
Este repositorio contiene los drivers para la antena WiFi Realtek RTL8188EUS y una serie de scripts para facilitar su instalación y puesta en marcha en sistemas Linux.

Nota: Los drivers contenidos en la carpeta drivers han sido obtenidos a partir del repositorio original de [AUTOR/REPOSITORIO ORIGINAL] (por favor, reemplaza este texto con la información adecuada). Se agradece y se dan los correspondientes créditos a su desarrollador original.

Contenido del Repositorio
drivers/
Carpeta que contiene los drivers obtenidos de la fuente original.

install_linux_headers.sh
Script que pregunta al usuario si desea instalar los linux headers (necesarios para compilar módulos del kernel) y procede a instalarlos si se confirma.
Advertencia: La instalación de los headers modifica componentes esenciales del sistema (es decir, los archivos de cabecera del kernel) y podría requerir un reinicio para que los cambios surtan efecto. Es importante asegurarse de que la versión instalada coincida con la versión del kernel en uso para evitar problemas de compatibilidad.

setup.sh
Script encargado de:

Actualizar la lista de paquetes.

Verificar e instalar los linux headers específicos para la versión actual del kernel.

Eliminar un módulo existente en caso de que esté cargado.

Acceder al directorio drivers, compilar e instalar el driver.

Configurar el sistema para evitar el conflicto con el módulo nativo (mediante la creación de un archivo de blacklist) y cargar el módulo compilado.

startWifi.sh
Script que realiza las siguientes acciones:

Carga el módulo del driver 8188eu para el chipset Realtek RTL8188EUS.

Reinicia el servicio NetworkManager para que el sistema reconozca los cambios.

Solicita al usuario que desconecte y reconecte el adaptador WiFi USB.

Espera a que la interfaz wlan0 aparezca.

Finaliza procesos que puedan interferir con el modo monitor y activa el modo monitor en la interfaz wlan0.

Pasos de Instalación y Uso
Clonar el repositorio:

bash
Copy
Edit
git clone <URL-del-repositorio>
Entrar al directorio:

bash
Copy
Edit
cd <nombre-del-directorio-clonado>  # Ej: cd REALTEK-RTL8188EUS
Dar permisos de ejecución a los scripts:

bash
Copy
Edit
chmod +x install_linux_headers.sh setup.sh startWifi.sh
Ejecutar install_linux_headers.sh:
Este script te preguntará si deseas instalar linux-headers-generic.

Advertencia:
La instalación de los linux headers modifica componentes críticos del sistema que son necesarios para compilar módulos del kernel. Es importante asegurarse de que se instalan los headers correspondientes a la versión actual del kernel, ya que una incompatibilidad podría ocasionar problemas en el funcionamiento del sistema.

Para ejecutar el script:

bash
Copy
Edit
./install_linux_headers.sh
Reiniciar el ordenador:
Después de instalar los headers, reinicia tu sistema para aplicar los cambios.

Ejecutar setup.sh:
Este script se encarga de actualizar el sistema, verificar e instalar los linux headers específicos si es necesario, compilar e instalar el driver, y cargar el módulo adecuado.
Ejecuta:

bash
Copy
Edit
./setup.sh
Ejecutar startWifi.sh:
Finalmente, este script configura la antena WiFi realizando las siguientes acciones:

Carga el módulo del driver.

Reinicia el servicio de red para refrescar la configuración.

Solicita al usuario reconectar el adaptador USB.

Espera a que la interfaz wlan0 aparezca.

Activa el modo monitor en la interfaz, eliminando posibles interferencias.

Para ejecutarlo:

bash
Copy
Edit
./startWifi.sh
Requisitos
Distribución Linux basada en Debian/Ubuntu (los scripts utilizan apt para la instalación de paquetes).

Acceso a privilegios de superusuario (se usan comandos con sudo).

Conexión a internet para actualizar paquetes y, si es necesario, descargar dependencias.

Créditos y Agradecimientos
Los drivers contenidos en la carpeta drivers han sido obtenidos del repositorio original de [AUTOR/REPOSITORIO ORIGINAL]. ¡Gracias por compartir y facilitar el desarrollo de este recurso!

Inspiración y aportes a la creación de los scripts por [TU NOMBRE O PSEUDÓNIMO].

Licencia
Este proyecto se distribuye bajo la [Licencia que prefieras, por ejemplo, MIT License]. Consulta el archivo LICENSE para más detalles.

