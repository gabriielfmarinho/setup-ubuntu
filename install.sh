#!/bin/bash

system_update() {
    sudo apt update
    sudo apt upgrade 
}

install_spotify() {
    curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update && sudo apt-get instalar spotify-client
}

install_chrome() {
    local FILE_PATH=$HOME/Downloads/google-chrome.deb
    wget -O $FILE_PATH https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i $FILE_PATH
    rm $FILE_PATH
    sudo apt install -y -f
}

install_slack() {
    local DIR_DOWNLOADS=$HOME/Downloads/slack.deb
    wget -O $DIR_DOWNLOADS https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.1-amd64.deb
    sudo dpkg -i $DIR_DOWNLOADS 
    rm $DIR_DOWNLOADS
    sudo apt install -y -f
}

install_gnome() {
    sudo apt-get install --no-install-recommends gnome-panel
}

install_git() {
    cp ./configuration-files/gitconfig ~/.gitconfig
}

install_jdk() {
    sudo apt install openjdk-11-jdk
}

install_node() {
    sudo npm install -g n
    sudo n stable
}

install_vs_code(){
    local DIR_DOWNLOADS=$HOME/Downloads/vs-code.tar.gz
    local DIR_WORKSPACE=$HOME/tetspoaposap
    wget -O $DIR_DOWNLOADS https://go.microsoft.com/fwlink/?LinkID=620884
    if [ ! -d $DIR_WORKSPACE ]; then
            mkdir $DIR_WORKSPACE
    fi 
    tar -zxvf $DIR_DOWNLOADS -C $DIR_WORKSPACE
}

install_intellij() {
    local DIR_DOWNLOADS=$HOME/Downloads/idea.tar.gz
    local DIR_WORKSPACE=$HOME/tools
    wget -O $DIR_DOWNLOADS https://download.jetbrains.com/idea/ideaIU-2019.2.tar.gz?_ga=2.90660698.1132001915.1565906577-390554571.1563971476
    if [ ! -d $DIR_WORKSPACE ]; then
            mkdir $DIR_WORKSPACE
    fi 
    tar -zxvf $DIR_DOWNLOADS -C $DIR_WORKSPACE
}

install_docker() {
    curl -sSL get.docker.io | sh
    sudo usermod -aG docker $USER
}

run() {
    system_update
    install_chrome
    install_slack
    install_gnome
    install_git
    install_node
    install_vs_code
    install_intellij
    install_spotify
    install_docker
}

run
if [ $? -eq 0 ]; then
echo 'Instalação finalizada com sucesso!'
else
echo 'Ocorreu erros durantes as instalações, verifique!'
fi