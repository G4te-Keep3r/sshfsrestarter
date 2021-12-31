pkill -kill -f "sshfs"
fusermount -uz ~/dir_name_goes_here
#repeat for other dirs

./mount-dirs-sshfs.sh

echo sshfs restarted
date -d "-5 hours"
date >> restartsshfs.log
