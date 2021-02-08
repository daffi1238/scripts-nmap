#ejemplo
#mostrar_puerto_estado $puertos $estado
#siendo puertos y estado los arrays con contienen precisamente
#puertos y estado de cada uno

function mostrar_puerto_estado () {  #llamar con los parámetros puertos y estado
  echo "la lista de puertos a analizar"
  puertos="$1"
  estado="$2"
  echo "${#puertos[@]}"
  for (( c=0; c<"${#puertos[@]}"; c++ ))
  do
     #Metemos la primera palabra de la linea en aux...
     echo ${puertos[c]}"      "${estado[c]}
     #echo "El numero de elementos es ${#puertos[@]}"
  done

}
