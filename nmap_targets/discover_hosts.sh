#nmap -sP 192.168.0.* -oN /tmp/nmap_discover.txt

IFS=$'\n' read -d '' -r -a lines < /tmp/nmap_discover.txt

indice=0
for (( c=0; c<="${#lines[@]}"; c++ ))
do

#echo $lines
#ip[c]="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$lines[c]")"
aux="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "${lines[c]}")"
echo "EL VALOR DE AUX ES $aux"
if [[ -z $aux ]]; then
  echo "La linea no tiene IP"
else
  ip[c]=$aux
  echo "LA IP GUARDADA ES $ip"
  echo ${ip[c]} >> /tmp/targets.txt

fi

done
