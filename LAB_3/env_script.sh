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

useradd -m -s /bin/bash $login
if [ "$?" = "0" ]
  then
      sed -i -e "s/#USERNAME#/${login}/g" /home/${login}/public_html/private_html/.htaccess
      echo $login:$PASSWORD | chpasswd
      
	usermod -G ftp,users $login
      usermod -g users $login
      groupdel $login
      exit 0
fi

# chmod 751 $login  /home/$login/public_html/private_html/.htpasswd


