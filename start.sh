#!/bin/bash

PORT="${PORT:-7500}"

_update() {
	echo "Updating Pavlov VR";
        cd ~/Steam && ./steamcmd.sh +login anonymous +force_install_dir /home/steam/pavlovserver +app_update 622970 -beta docker +exit
        ./steamcmd.sh +login anonymous +app_update 1007 +quit
        mkdir -p ~/.Steam/sdk64
        cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/steamclient.so
        cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/pavlovserver/Pavlov/Binaries/Linux/steamclient.so
}

_run() {
	echo "Running Pavlov VR Server";
        cd ~/pavlovserver && ./PavlovServer.sh -PORT="${PORT}"
}

case $1 in
"update")
	_update
	;;
	
"run")
	_run
	;;

*)
	_update
	_run
	;;
esac

