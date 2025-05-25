#!/bin/bash

# Variables
BACKUP_DIR="./backups"
DATE=$(date +%F_%H-%M)
CONTAINER="mariadb"
DB_NAME="taller"
DB_USER="root"
DB_PASS="rootpass"
FILE_NAME="$BACKUP_DIR/backup_$DATE.sql"

# Crear carpeta si no existeix
mkdir -p $BACKUP_DIR

# Fer la còpia de la base de dades des de dins del contenidor
docker exec $CONTAINER sh -c "mysqldump -u$DB_USER -p$DB_PASS $DB_NAME" > $FILE_NAME

# Missatge de confirmació
echo "Còpia feta: $FILE_NAME"
