# disk usage
# ===========
# monitoring team ----> checks the status of servers and websites
# if servers are down or usage of more memory---> they will give alert to Devops team

# hard-disk ---> just beside our laptop
# google drive/micro ---> they are in network, connecting through internet

# commands:
# =========
# lsblk
# sudo file -s /dev/xvdf
# sudo lsblk -f
# sudo mkfs -t xfs /dev/xvdf
# sudo mkdir /data
# sudo mount /dev/xvdf /data
# df -hT
# df -hT | grep xfs
# grep tmp
# df -hT | grep -v tmp
# df -hT | grep -vE 'tmp|File' {i dont want tmp file}
# df -hT | grep -vE 'tmp|File' | awk '{print $6F}'

# | ---> symbol for "or"
# & ---> symbol for "and"

#!/bin/bash
DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
message=""

while IFS= read line
do 
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')
    if [ $usage -ge $DISK_THRESHOLD ]
    then
        message+="High Disk Usage on $partition: $usage\n"
    fi   

done  <<< $DISK_USAGE

echo -e "message: $message"
