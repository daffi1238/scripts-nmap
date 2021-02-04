#Chequear los valores de un array
for (( c=0; c<="${#puertos[@]}"; c++ ))
do
   #Metemos la primera palabra de la linea en aux...
   echo ${puertos[c]}
   echo "El numero de elementos es ${#puertos[@]}"
done





function show_data () {  #llamar con los parámetros puertos y estado
  echo "la lista de puertos a analizar"
  puertos="$1"
  estados="$2"
  echo "${#puertos[@]}"
  for (( c=0; c<"${#puertos[@]}"; c++ ))
  do
     #Metemos la primera palabra de la linea en aux...
     echo ${puertos[c]}"      "${estados[c]}
     #echo "El numero de elementos es ${#puertos[@]}"
  done

}
