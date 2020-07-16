#!/bin/bash

# Autor: Xunil
# Descripción: Crea un fichero Bash Script con las preferencias del usuario.
# Versión: 1.0.0


read -r -p "¿Qué nombre quieres ponerle al script? " nom_Script
ext=$(echo "$nom_Script" | awk -F"." '{print $2}')

# Comprueba si la extensión es "sh" o no. Si no es "sh" se lo añade.
if [ "$ext" != "sh" ]; then

        nom_Script=$nom_Script.sh
        
fi

read -r -p "Ubicación del script: " loc_Script

while [ -e "$loc_Script/$nom_Script" ]; do

    read -r -p "El fichero ya existe. Elige otra ubicación: " loc_Script

done

ult_car=$(echo "${loc_Script: -1}")

if [ "$ult_car" = "/" ]; then
        loc_Script=$loc_Script
    else
        loc_Script=$loc_Script/
fi

#echo loc_Script | sed -e 's/.$//'

touch "$loc_Script/$nom_Script"

echo "#!/bin/bash" >> "$loc_Script/$nom_Script"

read -r -p "Autor del script: " author

if [ -z "$author" ]; then
        author=$(whoami)
        echo -e "\n# Author: $author" >> "$loc_Script/$nom_Script"
    else
        echo -e "\n# Author: $author" >> "$loc_Script/$nom_Script"
fi

fecha=$(date +%D)
echo -e "\n# Fecha: $fecha" >> "$loc_Script/$nom_Script"

read -r -p "Añade una descripción del script: " desc
echo -e "\n# Description: $desc" >> "$loc_Script/$nom_Script"
