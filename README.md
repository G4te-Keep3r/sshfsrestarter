# terms/identification
## monitor
	monitoring vm/vps
## server
	server that contains the the sshfs mount


# prep
## both
	clone into ~

## server
	mkdir sshfsrestartsignal
	put contents of server folder in ~ and make them executable
	fix user/host
	
### sshfsrestarter.sh
	optional - adjust date timezone offset or remove/comment out (only there for log readability)
### sshfs-restart.sh
	edit "fusermount -uz dirname1" with your sshfs dir
	> repeat that line for each sshfs dir
	optional - adjust date timezone offset or remove/comment out (only there for log readability)
### razadirs-sshfs.sh
	edit the following part for your sshfs mount
	> user@host:path /home/server_user/dir/ -p number
	repeat line for each other dir
### testsshfs.sh
	edit "ls ~/dir_name_goes_here/; echo" with your sshfs dir
	> repeat that line for each sshfs dir
	run ./testsshfs.sh | wc -l and remember the result

## monitor
	add key based ssh for monitor to access server
### sshfsmanager.sh
	fix userathost
	replace 1234567890 with the number from testsshfs.sh
	> you might want to subtract some from it so if you remove files the monitor wont always send restart signal, just make sure you choose a number larger than "ls ~ | wc -l" gives (on server)


# run
## server
	run sshfsrestarter.sh in a screen session

## monitor
	add this to cron
	> */15 * * * * ~/Desktop/sshfsmanager.sh


# how works
	sshfsmanager.sh has timeout to catch when locked up and "`echo "$sshout" | wc -l` -le 1234567890" catched when 1+ mounts unmount
	> timeout of 600 is arbitrary, but has seemed to work well to stay open long enough when being slow but not idle unnecessarily long when it has locked up
