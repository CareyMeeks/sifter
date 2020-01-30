#!/usr/bin/env bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
listing(){
    echo -e "${LBBLUE}"
    cat files/pingtest.pass
    echo -e "${NC}"
}

if [[ -d /opt/sifter/results/Rapidscan ]]; then
    echo ""
else
    mkdir /opt/sifter/results/Rapidscan
fi
echo -e "${ORNG}RapidscaN"
echo -e "*********${NC}"
echo -e "${YLW}Note: This module can take a while (30+ mins),"
echo -e "and will be run in the background. Feel free to keep using the tool.${NC}"
listing
echo -e "${W}Please enter your target: ${NC}"
read TARGET
sleep 1
echo "==================================================================================="
figlet -f mini "RapidscaN"
xterm python rapidscan.py ${TARGET} | tee /opt/sifter/results/Rapidscan/${TARGET}.txt
sleep 1
./modules/module.sh