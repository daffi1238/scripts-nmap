#Script que:
#1. Ejecuta el escaneo a un puerto específico de direcciones aleatorias y
#muestra por pantalla las que tengan dicho puerto abierto

puerto="500"
trap ctrl_c INT

function ctrl_c() {
        echo "** Trapped CTRL-C"
        aux1="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "${resultado}")"
        echo ${aux1}


}

echo "Entrando en nmap"
resultado="$(nmap -p$puerto --open -sU -iR 0)"
#resultado="$(nmap -p$puerto --open -sU 211.184.219.5)"

aux="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "${resultado}")"

echo ${aux}>/tmp/targets_$puerto.txt

echo ${aux}
echo ${resultado}






#variables que queremos que sobrevivan
echo "Fin del script"


# trap ctrl-c and call ctrl_c()
