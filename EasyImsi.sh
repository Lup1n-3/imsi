#!/bin/bash

# Directorio actual del script
script_dir="$(dirname "$0")"

# Cambiar al directorio /usr/src/IMSI-catcher
cd /usr/src/IMSI-catcher || exit

# Solicitar la contraseña antes de ejecutar el segundo comando
sudo -v

# Abrir el segundo programa en una terminal con sudo y ventana de xterm maximizada en ancho
xterm -maximized -e "sudo python3 simple_IMSI-catcher.py -s; exec bash" &
# Esperar unos segundos para que el segundo programa se inicie completamente
sleep 5

# Abrir el primer programa en otra terminal con sudo
xterm -e "sudo QT_X11_NO_MITSHM=1 grgsm_livemon; exec bash" &
