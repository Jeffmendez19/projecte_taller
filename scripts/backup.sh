#!/bin/bash
BACKUP_DIR="./backups"
DATE=$(date +%F_%H-%M)
CONTAINER="mariadb"
DB_NAME="taller"
DB_USER="root"
DB_PASS="rootpass"
FILE_NAME="$BACKUP_DIR/backup_$DATE.sql"
mkdir -p $BACKUP_DIR
docker exec $CONTAINER sh -c "mysqldump -u$DB_USER -p$DB_PASS $DB_NAME" > $FILE_NAME
echo "Còpia feta: $FILE_NAME"
