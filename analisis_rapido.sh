nmap -sS 127.0.0.1 -oN /tmp/nmap.txt

IFS=$'\n' read -d '' -r -a lines < /tmp/nmap.txt
printf "${lines[4]}"

#Recorremos lineas hasta llegar a PORT
start=0
for (( c=0; c<="${#lines[@]}"; c++ ))
do
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
	if [ ${puertos[indice]:0:1} = "#" ]; then
	echo "Entra en el if en el indice $indice"
	c=${#lines[@]}

	else
	protocolos[indice]=$(echo ${puertos[indice]} | cut -d '/' -f 2)
	#echo ${protocolos[indice]}
	puertos[indice]=$(echo ${puertos[indice]} | cut -d '/' -f 1)
	#echo ${puertos[indice]}
	estado[indice]=$(echo "${lines[c]}" | awk '{print $2;}')
	echo "Entra en el else"
	fi


	c="$(($c+1))"
done
