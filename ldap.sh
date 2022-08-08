#!/bin/bash
F0='\033[0;0m'  #Normal
FG='\033[1;92m' #verde
FY='\033[1;93m' #Amarillo
FR='\033[1;91m' #Rojo
FB='\e[0;34m'   #Blue
######################__Menu__############################################
clear;
function menu {
echo -e "${FY}..:: Welcome to LDAP ::..${F0}\n";
        echo -e "0) Creacion de Usuario";
        echo -e "1) Creacion de Grupo";
        echo -e "2) Agregar Usuario a Grupo";
        echo -e "3) Consultar un Usuario";
        echo -e "4) Consultar un Grupo";
        echo -e "5) Eliminar un Usuario";
        echo -e "6) Eliminar un Grupo";
		echo -e "7) ${FR}Salir${F0}";
	read OP;
	clear
###0###
            if [ $OP = 0 ];
                then
        cero        
                fi
###1###
            if [ $OP = 1 ];
                then
        uno        
                fi
###2###
            if [ $OP = 2 ];
                then
        dos        
                fi
###3###
            if [ $OP = 3 ];
                then
        tres        
                fi
###4###
            if [ $OP = 4 ];
                then
        cuatro        
                fi
###5###
            if [ $OP = 5 ];
                then
        cinco        
                fi
###6###
            if [ $OP = 6 ];
                then
        seis        
                fi
###7###
            if [ $OP = 7 ];
                then
        salir        
                fi
}
######################__Funciones__############################################
clear
function cero {
echo -e "${FY}Creacion de Usuario${F0}"
echo -e "Indica el Usuario"
read "user";
#se almacena /etc/passwd
useradd ${user};
passwd ${user};
#Esta espera por si salta algun error
sleep 4;
clear
menu
}
clear
function uno {
echo -e "${FY}Creacion de Grupo${F0}"
echo -e "Indica el Grupo"
read "group";
#se almacena /etc/group
groupadd ${group};
#Esta espera por si salta algun error
sleep 4;
clear
menu
}
clear
function dos {
echo -e "${FY}Agregar Usuario a Grupo${F0}"
echo -e "Indica el Usuario"
read "user";
echo -e "Indica el Grupo"
read "group";
usermod -G ${group} ${user};
#Esta espera por si salta algun error
sleep 4;
clear
menu
}
function tres {
echo -e "${FY}Consultar un Usuario${F0}"
echo -e "Indica el Usuario";
read "user";
#se almacena /etc/passwd
# name_user=$(echo "${user}")
search_user=$(id ${user});
echo ${search_user};
#Esta espera por si salta algun error
sleep 4;
clear
menu
}
function cuatro {
echo -e "Consultar un Grupo";
echo -e "Indica el Grupo";
read "group";
search_group=$(cat /etc/group | grep ${group});
echo ${search_group};
#Esta espera por si salta algun error
sleep 4;
clear
menu
}
function cinco {
echo -e "Eliminar un Usuario";
echo -e "Indica el Usuario";
read "user";
delete_user=$(userdel -r ${user});
echo ${delete_user};
#Esta espera por si salta algun error
sleep 4;
clear
menu
}
function seis {
echo -e "Eliminar un Grupo";
echo -e "Indica el Grupo";
read "group";
delete_group=$(groupdel -f ${group});
echo ${delete_group};
#Esta espera por si salta algun error
sleep 4;
clear
menu
}
function salir {
                echo -e "${FB}Hasta la vista Baby${F0}";
                exit
}
clear
menu
