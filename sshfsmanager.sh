userathost=serveruser@serverhost

date >> ~/sshfsrestarter/sshfsmanager.log

sshout=$(timeout 600 ssh $userathost '~/sshfsrestarter/testsshfs.sh')

if [ `echo "$sshout" | wc -l` -le 1234567890 ]; then 
    echo "$sshout" | wc -l >> ~/sshfsrestarter/sshfsmanager.log

    ssh $userathost 'echo do it > ~/sshfsrestarter/sshfsrestartsignal/file.txt'
    echo sshfs restart signal sent >> ~/sshfsrestarter/sshfsmanager.log

    ssh $userathost 'date -d "-5 hours"; date >> ~/sshfsrestarter/sshfsmanager.log'
else
    echo sshfs is fine >> ~/sshfsrestarter/sshfsmanager.log
    echo "$sshout" | wc -l >> ~/sshfsrestarter/sshfsmanager.log
fi
echo >> ~/sshfsrestarter/sshfsmanager.log
