#!/bin/bash

# Colores
ROJO="\e[31m"
VERDE="\e[32m"
AMARILLO="\e[33m"
AZUL="\e[34m"
RESET="\e[0m"

function banner() {
    echo -e "${AZUL}=============================="
    echo "      BUSCADOR DE ARCHIVOS     "
    echo "==============================${RESET}"
}

function menu() {
    echo -e "${AMARILLO}Seleccione el modo de búsqueda:${RESET}"
    echo "1) Buscar archivos por NOMBRE"
    echo "2) Buscar en el contenido de los archivos"
    echo "3) Guardar resultados en un archivo"
    echo "4) Salir"
    echo -n "Opción: "
}

# Guardar el resultado de la búsqueda en esta variable
RESULTADOS=""

function buscar_nombre() {
    echo -n "Ingrese el nombre del archivo a buscar: "
    read patron
    echo -e "${AZUL}Buscando... '${nombre}'...${RESET}"
    RESULTADOS=$(find . -type f | grep -i "$patron")
    echo -e "${VERDE}$RESULTADOS${RESET}"
}

while true; do
    clear
    banner
    menu
    read opcion

    case $opcion in
        1) buscar_nombre ;;
        4) echo -e "${VERDE}Saliendo...${RESET}"; exit 0 ;;
        *) echo -e "${ROJO}Opción no válida${RESET}" ;;
    esac

    echo
    read -p "Presione ENTER para continuar..."
done