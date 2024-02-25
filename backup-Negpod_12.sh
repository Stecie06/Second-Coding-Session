#!/bin/bash

remote_host="2f05c1f8800b.3be8ebfc.alu-cod.online"
remote_username="2f05c1f8800b"
remote_password="d4a1d225d0abda9549d8"
remote_directory="/summative/1023-2024j"

backup_filename="backup-Negpod_12.tar.gz"

tar -zcf "$backup_filename" .

scp -o StrictHostKeyChecking=no "$backup_filename" "$remote_username@$remote_host:$remote_directory"

rm "$backup_filename"

echo "Backup completed successfully."
