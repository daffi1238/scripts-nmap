#Script que:
#1. Hace un análisis rápido y genera un txt en la carpeta /tmp
#2. Analiza dicho fichero y sonsaca en los correspondientes array's la información de puerto, protocolo y estado
#3. Tras obtener esto aplica a los distintos puertos análisis profundos según la condición

ip_addr="127.0.0.1"
nmap -sS $ip_addr -p- -oN /tmp/nmap_tcp.txt
#nmap -sU 127.0.0.1 -oN /tmp/nmap_udp.txt


#variables que queremos que sobrevivan
puertos=0
estado=0


IFS=$'\n' read -d '' -r -a lines < /tmp/nmap_tcp.txt

#printf "${lines[4]}"

#Recorremos lineas hasta llegar a PORT
start=0
for (( c=0; c<="${#lines[@]}"; c++ ))
do
  echo "For para leer el fichero linea a linea"
   #Metemos la primera palabra de la linea en aux...
   aux=$(echo "${lines[c]}" | awk '{print $1;}')
   echo "El valor de aux es $aux"
   #...y comparamos con con "PORT" para empezar a leer desde ahí
   printf "Iteración del for con el valor $c\n"
   if [ "$aux" = "PORT" ]; then
	printf "Dentro del if\n"
	start=$c
	c="${#lines[@]}"
   fi
done
#Para que empieze en el siguiente salto
start="$(($start + 1))"


#Ahora en un array meto todos los puertos propensos al victimario
#for ((c=start; c<="${#lines[@]}"; c++ ))
c=$start
while [ $c -lt ${#lines[@]} ]
do
	indice=$((c-start))
	echo $indice
	puertos[indice]=$(echo "${lines[c]}" | awk '{print $1;}')
	if [ ${puertos[indice]:0:1} == "#" ]; then
	echo "Entra en el if en el indice $indice"
  unset puertos[-1]
	c=${#lines[@]}

	else

	puertos[indice]=$(echo ${puertos[indice]} | cut -d '/' -f 1)
	#echo ${puertos[indice]}
	estado[indice]=$(echo "${lines[c]}" | awk '{print $2;}')
	echo "Entra en el else"
	fi


	c="$(($c+1))"
done
#############################################
#Muestra la información con la que trabajaremos
source ./src/mostrar_puerto_estado.sh
echo "la lista de puertos a analizar"
mostrar_puerto_estado $puertos $estado
#El siguiente paso es proponer los distintos análisis según protocolo y estado
#tcp abierto
#tcp filtrado


source ./src/deep_scanTCP.sh
deep_scapTCP $ip_addr $puertos
