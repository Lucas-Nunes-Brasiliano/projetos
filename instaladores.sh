#!/bin/bash	

# Execute o script na pasta download #

## Começando meu shell Script ##

## Removendo travas eventuais do apt ##
sudo rm / var / lib / dpkg / lock-frontend
sudo rm / var / cache / apt / archives / lock

## Atualização dos repositórios ##
sudo apt update

## Dowload de programas externos ##
mkdir Programas
cd Programas

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;

# Instalação dos repositórios
sudo dpkg -i *.deb
sudo apt-get install -f

##Instalando o snap 
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update
sudo apt install snapd

#Instalando aplicativos snaps
sudo snap install deezer-unofficial-player
sudo snap install code --classic
sudo snap install okular 
sudo snap install mailspring
sudo snap install vlc 


## Programas Repositórios
sudo add-apt-repository ppa:inkscape.dev/stable -y
sudo add-apt-repository ppa:ubuntuhandbook1/gimp -y
sudo apt install ffmpeg -y
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
sudo add-apt-repository ppa:atareao/telegram -y
sudo add-apt-repository -y ppa:ricotz/docky -y
sudo add-apt-repository ppa:ubuntuhandbook1/apps -y
sudo vim /etc/apt/sources.list.d/mega.list -y


# Atualizando repositórios
sudo apt update
sudo apt-get update

# Instalando aplicativos
sudo apt install inkscape -y
sudo apt install gimp -y
sudo apt install obs-studio -y 
sudo apt-get install kdenlive -y
sudo apt-get install telegram -y
sudo apt-get install gparted -y
sudo apt-get install python3 -y 
sudo apt-get install python3-pip -y 
sudo apt-get install scribus -y 
sudo apt-get install synapse -y


# Deletando arquivos
sudo rm Release.key -y
sudo rm /etc/apt/sources.list.d/mega.list -y

## Thema Flat remix

sudo apt install git -y;
git clone https://github.com/daniruiz/flat-remix
git clone https://github.com/daniruiz/flat-remix-gtk
mkdir -p ~/.icons && mkdir -p ~/.themes
cp -r flat-remix/Flat-Remix* ~/.icons/ && cp -r flat-remix-gtk/themes-old/Flat-Remix-GTK* ~/.themes/
