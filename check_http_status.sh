#!/bin/bash

# URL para verificar
URL="http://localhost:80"

# Verifica se o código de status HTTP é 200
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

# Define a métrica com base no status
if [ "$HTTP_STATUS" -eq 200 ]; then
  echo "http_status_code 1" > /var/lib/node_exporter/textfile_collector/http_status.prom
else
  echo "http_status_code 0" > /var/lib/node_exporter/textfile_collector/http_status.prom
fi
