sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3,cache_timeout=3600 user@host:path /home/server_user/dir/ -p number
