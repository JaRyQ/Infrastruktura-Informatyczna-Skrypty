#!/bin/bash

#tworzymy login użytkownika 
echo "Podaj imię i nazwisko uzytkownika:"
read NAME SURNAME
login=${NAME:0:1}$SURNAME #mjarystow
echo "Podaj hasło:"
read -s PASSWORD


#sprawdzamy czy uzytkownik istnieje w bazie użytkowników
if id "$login" &>/dev/null; then # istnieje uzytkownik o takiej nazwie
    login=$NAME.$SURNAME
fi

echo "Twoj login do systemu: "$login
echo "zapamietaj podane przez Ciebie haslo!!!"

#tworzenie uzytkownika
#szyfrowanie hasla
#encr=mkpasswd $PASSWORD

#echo $encr
useradd -m  -s /bin/bash $login
echo $login:$PASSWORD | chpasswd
#echo -e $PASSWORD | passwd  $login
#public_html -> private_html zawarte w /etc/skel V
#welcome message zawarte w /etc/skel/.bashrc V
# skonfigurowane aliasy w /etc/skel/.bashrc V

