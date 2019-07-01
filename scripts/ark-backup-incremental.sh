#!/bin/sh
for i in $(
    find /mnt/daemon-data/*/ShooterGame/Saved -maxdepth 0 -type d
); do
    rootDirectory=$(echo $i | sed -e 's/ShooterGame\/Saved//g')
    containerGuid=$(basename $rootDirectory)
    tar --create --verbose --gzip --listed-incremental=/mnt/backup/$containerGuid.snap --file=/mnt/backup/${containerGuid}_`date -I`.tar.gz --directory=$rootDirectory/ShooterGame/ Saved
done

