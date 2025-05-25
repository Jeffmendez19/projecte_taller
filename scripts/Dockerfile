# scripts/Dockerfile

FROM alpine:latest

# Instal·lem bash i el client de MySQL
RUN apk add --no-cache bash mysql-client

# Copiem els scripts
COPY backup.sh /scripts/backup.sh
COPY check_services.sh /scripts/check_services.sh

# Donem permisos d'execució
RUN chmod +x /scripts/*.sh
