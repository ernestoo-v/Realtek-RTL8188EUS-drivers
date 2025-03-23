#!/bin/bash

# Carga el módulo específico '8188eu' para el chipset Realtek RTL8188EUS.
sudo modprobe 8188eu

# Reinicia NetworkManager para refrescar las conexiones de red y reconocer los cambios en los drivers.
sudo systemctl restart NetworkManager

# Pide al usuario que desconecte y vuelva a conectar el adaptador Wi-Fi USB.
echo "Please disconnect the WiFi USB adapter and reconnect it."

# Pide al usuario que presione Enter cuando haya reconectado el adaptador.
echo "Press Enter when you are ready..."
read -r

# Informa que el script está esperando a que la interfaz 'wlan0' aparezca.
echo "Waiting for 'wlan0' to appear..."

# Inicia un bucle que se ejecuta hasta que 'wlan0' sea detectada.
while true; do
    # Verifica si 'wlan0' está presente sin mostrar errores.
    if iwconfig 2>/dev/null | grep -q "wlan0"; then
        # Si 'wlan0' es detectada, imprime un mensaje y sale del bucle.
        echo "'wlan0' detected!"
        break
    fi
    # Pausa durante 2 segundos antes de verificar nuevamente.
    sleep 2
done

# Informa que el adaptador Wi-Fi USB ha sido reconectado exitosamente.
echo "WiFi USB reconnected successfully."

# Termina procesos que podrían interferir con el modo monitor.
sudo airmon-ng check kill

# Pone la interfaz 'wlan0' en modo monitor.
sudo airmon-ng start wlan0

# Asegura que la interfaz 'wlan0' esté activada.
sudo ifconfig wlan0 up
