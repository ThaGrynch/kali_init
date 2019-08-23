#!/bin/bash
clear

export DISPLAY=localhost:0.0 ;
sudo apt-get update ;
sudo apt-get upgrade -y ;
sudo apt-get install -y build-essential ;
sudo apt-get install -y curl ;
sudo apt-get install -y binutils ;
sudo apt-get install -y git ;
sudo apt-get install -y xclip ;
sudo apt-get install -y python3 ;
sudo apt-get install -y python3.7-dev ;
sudo apt-get install -y python3-distutils ;
sudo apt-get install -y neofetch ;
sudo apt-get install -y postgresql ;

curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" ;
sudo python3 get-pip.py ;

sudo git clone https://github.com/trustedsec/social-engineer-toolkit/ set/ ;
cd set ;
sudo pip install -r requirements.txt ;

cd .. ;
clear ;
echo "Please enter your Kali OS username below: " ;
read username ;

sudo curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /home/$username/msfinstall ;
sudo chmod 755 /home/$username/msfinstall ;
sudo ./msfinstall ;

sudo echo 'neofetch ;' >> /home/$username/.bashrc ;

touch /home/$username/.functions ;
echo 'test -e ~/.functions && . ~/.functions ;' >> /home/$username/.profile ;


echo "alias pbcopy='xclip -selection clipboard'" >> /home/$username/.functions ;
echo "alias pbpaste='xclip -selection clipboard -o'" >> /home/$username/.functions ;
echo "alias functions='nano ~/.functions'" >> /home/$username/.functions ;

echo "alias setk='cd ~/set/ && sudo python3 setoolkit'" >> /home/$username/.functions ;
echo "alias msf='msfconsole'" >> /home/$username/.functions ;
echo 'echo "$(tput setaf 1)To run the Social Engineering Toolkit use $(tput setaf 2)setk"' >> /home/$username/.functions ;
echo 'echo "$(tput setaf 1)To run the MetaSploit Framework w/ Database Support use $(tput setaf 2)msf$(tput sgr0)"' >> /home/$username/.functions ;

sudo service postgresql start ;

sudo apt-get update ;
sudo apt-get upgrade -y ;

clear ;
exit
exit
exit
## Complete