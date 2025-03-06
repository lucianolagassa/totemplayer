#!/bin/bash

## Validar Usuario
UserName=`whoami`
if [ "$UserName" = "root" ]
then
    echo "Error, No esta permitido ejecutar el script como usuario Root."
    exit 1
fi

wget -c https://github.com/lucianolagassa/totemplayer/archive/refs/heads/main.zip -O totemplayer-main.zip
unzip totemplayer-main.zip
cd totemplayer-main
sh setup.sh
cd ..
rm -R totemplayer-main*
echo "Instalación completada, reiniciar equipo para continuar."