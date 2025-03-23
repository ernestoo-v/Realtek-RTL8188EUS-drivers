#!/bin/bash

# Actualizar lista de paquetes
sudo apt update

# Verificar e instalar headers
KERNEL_VERSION=$(uname -r)
if [ ! -d "/usr/src/linux-headers-$KERNEL_VERSION" ]; then
    echo "Instalando linux-headers-$KERNEL_VERSION..."
    sudo apt-get install -y bc
    sudo apt install -y bc linux-headers-$KERNEL_VERSION
    if [ $? -ne 0 ]; then
        echo "Error: No se pudieron instalar los headers."
        exit 1
    fi
else
    echo "Los headers ya están instalados."
fi

# Eliminar módulo existente
sudo rmmod r8188eu.ko 2>/dev/null || true

# Entrar al directorio drivers
cd drivers || { echo "Error: Directorio 'drivers' no encontrado."; exit 1; }

# Escribir el archivo como root con tee
echo "blacklist r8188eu.ko" | sudo tee /etc/modprobe.d/realtek.conf

# Compilar e instalar driver
make || { echo "Error en 'make'."; exit 1; }
sudo make install || { echo "Error en 'make install'."; exit 1; }

# Cargar el módulo
sudo modprobe 8188eu

echo "Instalación completada con éxito."
