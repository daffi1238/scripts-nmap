# scripts-nmap
Una serie de scripts para automatizar algunas funcionalidades con nmap separando los protocolos tcp y udp

1. analisis_rapido.sh aplica un escaneo básico para el descubrimiento de puertos, guarda los puertos, el protocolo y el estado en una serie de arrays a los cuales se acudirán para aplicar según cada caso pertinente un escaneo adaptado.

2. Al obtener la lista de todos los puertos abierto le aplicamos a dichos puertos un escaneo más en profundidad
