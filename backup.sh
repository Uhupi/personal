#!/bin/bash

source "$(dirname "$0")/.env"
LOCAL_DIR="$HOME/Downloads"

for DB in "${DATABASES[@]}"; do
  REMOTE_FILE="/root/${DB}_$(date +%Y%m%d).sql.gz"

  echo "Dumping database '$DB' on server..."
  ssh -i ~/.ssh/id_backup $SERVER "mysqldump -u admin -p\$(cat /etc/psa/.psa.shadow) --no-tablespaces $DB | gzip > $REMOTE_FILE"

  echo "Downloading dump to $LOCAL_DIR..."
  scp -i ~/.ssh/id_backup "$SERVER:$REMOTE_FILE" "$LOCAL_DIR/"

  echo "Removing dump from server..."
  ssh -i ~/.ssh/id_backup $SERVER "rm -f $REMOTE_FILE"

  echo "Done! File saved to $LOCAL_DIR/$(basename $REMOTE_FILE)"
done

echo "Compressing images/users folder on server..."
REMOTE_IMAGES="/var/www/vhosts/lvps83-169-23-127.dedicated.hosteurope.de/intercambiando/images/users"
REMOTE_IMAGES_FILE="/root/intercambiando_images_users_$(date +%Y%m%d).tar.gz"
ssh -i ~/.ssh/id_backup $SERVER "tar -czf $REMOTE_IMAGES_FILE -C $(dirname $REMOTE_IMAGES) $(basename $REMOTE_IMAGES)"

echo "Downloading compressed images..."
scp -i ~/.ssh/id_backup "$SERVER:$REMOTE_IMAGES_FILE" "$LOCAL_DIR/"

echo "Removing compressed file from server..."
ssh -i ~/.ssh/id_backup $SERVER "rm -f $REMOTE_IMAGES_FILE"

echo "Done! Images saved to $LOCAL_DIR/$(basename $REMOTE_IMAGES_FILE)"
