#!/bin/bash
# Contenidors que volem comprovar
containers=("mariadb" "flask_api" "web_frontend")
echo "Estat dels contenidors:"
for container in "${containers[@]}"
do
    status=$(docker inspect -f '{{.State.Status}}' "$container" 2>/dev/null)
    if [ "$status" = "running" ]; then
        echo "$container està en execució"
    else
        echo "$container NO està funcionant (estat: $status)"
    fi
done
