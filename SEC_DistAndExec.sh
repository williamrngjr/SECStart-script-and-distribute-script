#!/bin/bash
# This is in landscape FP-SECMONTEST.wdf.sap.corp
date=$(date +%F)
logfile=/tmp/sec_distribution_log_${date}.log

for host in $(cat SEC_SystemsList)
do
    echo "Now distributing to host : $host " >> $logfile
    scp /tmp/secstartlinux-22Feb2017.tgz tdcroot@$host:/tmp/secstartlinux-22Feb2017.tgz | tee -a $logfile
    ssh tdcroot@$host "tar xvzf /tmp/secstartlinux-22Feb2017.tgz -C / && /tmp/SECPutToRunLevel.sh" | tee -a $logfile
    echo "  " >> $logfile
    echo "  " >> $logfile
    echo "  " >> $logfile
done
