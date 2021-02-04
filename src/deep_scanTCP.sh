#Funciones relacionadas con el escaneo en profundidad de cada uno de los puertos tcp descubiertos

function deep_scapTCP() {  #llamar con los parámetros puertos y estado
#Ejemplo    deep_scapTCP ip_addr puertos
ip="$1"
puertos="$2"

#Convertirmos el array de puertos en una cadena apta para nmap
strPuertos=""
cnt=${#puertos[@]}

for ((i=0;i<cnt;i++)); do
    strPuertos="$strPuertos${puertos[i]}",
    echo $strPuertos
done


nmap -sT -A -vv -n -Pn $ip -p $strPuertos -oX /tmp/deep_scanTCP_$ip.xml

}
