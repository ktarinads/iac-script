#!/bin/bash

#logar como root
/bin/su -

#preparando o ambiente e removendo vestígios
userdel -r carlos &&
userdel -r maria &&
userdel -r joao &&
userdel -r debora &&
userdel -r sebastiana &&
userdel -r roberto &&
userdel -r josefina &&
userdel -r amanda &&
userdel -r rogerio
groupdel GRP_ADM && groupdel GRP_VEN && groupdel GRP_SEC

#ls /
mkdir /publico && mkdir /adm && mkdir /ven && mkdir /sec 

#groups
groupadd GRP_ADM && groupadd GRP_VEN && groupadd GRP_SEC

useradd carlos -m -s /bin/bash -p $(oppenssl passwd -crypt Senha123) -G GRP_ADM && 
useradd maria -m -s /bin/bash -p $(oppenssl passwd -crypt Senha123) -G GRP_ADM && 
useradd joao -m -s /bin/bash -p $(oppenssl passwd -crypt Senha123) -G GRP_ADM && 

useradd debora -m -s /bin/bash -p $(oppenssl passwd -crypt Senha123) -G GRP_VEN &&
useradd sebastiana -m -s /bin/bash -p $(oppenssl passwd -crypt Senha123) -G GRP_VEN  &&
useradd roberto -m -s /bin/bash -p $(oppenssl passwd -crypt Senha123) -G GRP_VEN &&  

useradd josefina -m -s /bin/bash -p $(oppenssl passwd -crypt Senha123) -G GRP_SEC && 
useradd amanda -m -s /bin/bash -p $(oppenssl passwd -crypt Senha123) -G GRP_SEC && 
useradd rogerio -m -s /bin/bash -p $(oppenssl passwd -crypt Senha123) -G GRP_SEC && 

#podemos usar usermod pra adicionar grupos tbm

chown root:GRP_ADM /adm && chown root:GRP_VEN /ven && chown root:GRP_SEC /sec
chmod 770 /adm && chmod 770 /ven && chmod 770 /sec
chmod 777 /publico
