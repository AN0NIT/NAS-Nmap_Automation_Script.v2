#!/bin/bash

IP=0
FLAG=0

banner(){
	echo -n ICAgICAgICAgICAsLiAgICAgICAgICzCt8K0JzsgJyAgICAgICAgICAgICAgICAgICwuLCAgICcgICAgICAgICAgICAgICAgICAgLC4gLSwgICAgCiAgICAgIDsnwrQqwrQgLCdcICAgICAgICwnICAnOydcwrAgICAgICAgICAgICAgICA7wrQgICAnwrcgLiwgICAgICAgICAgICAsLsK3J8K0LCAgICAsJ1wgICAKICAgICAgOyAgICAnOzo6XCAgICAgIDsgIDs6OidcICAgICAgICAgICAgIC7CtCAgLi0sICAgICc7XCAgICAgICzCtyfCtCAuwrfCtCfCtC3CtyfCtDo6OjpcJyAKICAgICA7ICAgICAgJ1w7JyAgICAgIDsgIDs6Ojo7ICAgICAgICAgICAgLyAgIC86XDonOyAgIDs6J1wnICAgOyAgICAnOzo6Olw6Olw6Ojs6JyAgCiAgICAsJyAgLCdgXCAgIFwgICAgICA7ICA7Ojo6OyAgICAgICAgICAsJyAgLCc6Ojo6J1wnOyAgOzo6JzsgICBcwrcuICAgIGDCtzs6Jy3CtyfCtCAgICAgCiAgICA7ICA7Ojo7J1wgICdcICAgIDsgIDs6Ojo7ICAgICAgICwuLcK3JyAgJ8K3fl4qJ8K0wqgsICAnOzo6OyAgICBcOmDCty4gICAnYMK3LCAgJyAgICAgCiAgIDsgIDs6Ojo7ICAnXCAgJ1wgLCcgIDs6Ojo7JyAgICAgICAnOiwgICzCtzrCsirCtMKowq8nYDsgIDs6Oic7ICAgICAgYMK3OidgwrcsICAgXCcgICAgICAKICAsJyAsJzo6OycgICAgICdcICAgwqggLCdcOjo7JyAgICAgICAgLCcgIC8gXDo6Ojo6Ojo6JzsgIDs6Oic7ICAgICAgICwuJy06OycgICzCt1wgICAgIAogIDsuJ1w6OjsgICAgICAgIFxgKsK0XDo6XDsgwrAgICAgICAsJyAsJzo6OjpcwrfCsionwrTCqMKvJzosJ1w6OyAgICzCtyfCtCAgICAgLC7Ct8K0Ojo6J1wgICAgCiAgXDo6OlwnICAgICAgICAgICdcOjo6XDonICcgICAgICAgIFxgwqhcOjo6LyAgICAgICAgICBcOjpcJyAgICBcYConwrRcOjo6Ojo6Ojo7wrcn4oCYICAgCiAgICBcOicgICAgICAgICAgICAgYCrCtCfigJogICAgICAgICAgICdcOjpcOycgICAgICAgICAgICAnXDsnICAnICAgXDo6OjpcOjs6wrfCtCAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBgwqgnICAgICAgICAgICAgICAgICAgICAgICAgJ2AqJ8K04oCYICAgICA= | base64 -d
	echo "				"
	echo "                                                 The Nmap Automation Script v2.0"
	echo "                                                                   Author:AN0NIT"

}



check_dir(){

if [ ! -d "nmap" ]; then
	mkdir nmap
fi

}

get_ip(){

check_re
if [ $FLAG == "0" ]; then
	echo "[!]Enter the ip addr to run nmap scan against:"
	read IP

fi
echo "IP is:$IP"
}

check_re(){
if [ $IP != "0" ]; then
echo "[!]Do you want to give new IP(y/n):"
read CH
	if [ "$CH" == "y" ]; then
		FLAG=0
	else
		FLAG=1
	fi
fi
}

banner
choice="PingScan AggresiveScan AllPortScan DoAll Exit"

select p in $choice; do
	if [ $REPLY -eq "1" ]; then
		get_ip
		check_dir
		nmap -Pn -oN nmap/ping_scan $IP
		echo "[+]Output saved in nmap/ping_scan"
	elif [ $REPLY -eq "2" ]; then
		get_ip
		check_dir
		nmap -T4 -A -sC -sV -oN nmap/aggro_scan $IP
		echo "[+]Output saved in nmap/aggro_scan"
	elif [ $REPLY -eq "3" ]; then
		get_ip
		check_dir
                nmap -T5 -p- -oN nmap/all_ports $IP
		echo "[+]Output saved in nmap/all_ports"
	elif [ $REPLY -eq "4" ]; then
		get_ip
		check_dir
        	nmap -Pn -oN nmap/ping_scan $IP
		nmap -T4 -A -sC -sV -oN nmap/aggro_scan $IP
		nmap -T5 -p- -oN nmap/all_ports $IP
		echo "[+]Output saved in nmap/ directory"
	elif [ $REPLY -eq "5" ]; then
		printf "Happy Hacking....\n"
		exit

	else
		echo "+============+"
		echo "|Help Options|"
		echo "+===============+"
		echo "|1.PingScan     |"
		echo "|2.AggresiveScan|"
		echo "|3.AllPortScan  |"
		echo "|4.DoAll        |"
		echo "|5.Exit         |"
		echo "+===============+"

	fi
done

