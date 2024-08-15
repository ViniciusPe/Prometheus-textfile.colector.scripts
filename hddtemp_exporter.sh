#!/bin/bash

# Verifique a temperatura dos discos usando hddtemp
for disk in /dev/sd?; do
    temp=$(sudo hddtemp -n "$disk")
    
    # Se a temperatura foi capturada, exibir a métrica
    if [ -n "$temp" ]; then
        echo "hddtemp_temperature_celsius{disk=\"$disk\"} $temp"
    fi
done
