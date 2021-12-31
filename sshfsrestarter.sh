while inotifywait -qqre modify sshfsrestartsignal;
do
    date -d "-5 hours"
    echo down, need to restart
    ./sshfs-restart.sh
    echo restarted
    rm sshfsrestartsignal/file.txt
    echo file deleted
    echo
done
