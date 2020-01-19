#!/bin/bash

system_update() {
    sudo apt update -y
    sudo apt upgrade -y
}

install_spotify() {
    sudo snap install spotify
}

install_chrome() {
    local FILE_PATH=$HOME/Downloads/google-chrome.deb
    wget -O $FILE_PATH https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i $FILE_PATH
    rm $FILE_PATH
    sudo apt install -y -f
}

install_slack() {
    local FILE_PATH=$HOME/Downloads/slack.deb
    wget -O $FILE_PATH https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.1-amd64.deb
    sudo dpkg -i $FILE_PATH 
    rm $FILE_PATH
    sudo apt install -y -f
}

install_gnome() {
    sudo apt-get install --no-install-recommends gnome-panel
}

install_git() {
    cp ./configuration-files/gitconfig ~/.gitconfig
}

install_jdk11() {
    sudo apt install openjdk-11-jdk
}

install_node() {
    sudo npm install -g n
    sudo n stable
}

install_npm() {
    sudo apt install npm -y 
}

install_vs_code() {
    local FILE_PATH=$HOME/Downloads/vs-code.tar.gz
    local DIR_WORKSPACE=$HOME/tools
    wget -O $FILE_PATH https://go.microsoft.com/fwlink/?LinkID=620884
    if [ ! -d $DIR_WORKSPACE ]; then
            mkdir $DIR_WORKSPACE
    fi 
    tar -zxvf $FILE_PATH -C $DIR_WORKSPACE
    rm $FILE_PATH
}

install_intellij() {
    local FILE_PATH=$HOME/Downloads/idea.tar.gz
    local DIR_WORKSPACE=$HOME/tools
    wget -O $FILE_PATH https://download-cf.jetbrains.com/idea/ideaIC-2019.2.tar.gz
    if [ ! -d $DIR_WORKSPACE ]; then
            mkdir $DIR_WORKSPACE
    fi 
    tar -zxvf $FILE_PATH -C $DIR_WORKSPACE
    rm $FILE_PATH
}

install_docker() {
    sudo apt install docker -y
    sudo apt install docker-compose -y
    sudo usermod -aG docker $USER
}

install_pulse() {
    sudo apt-get install libwebkitgtk-1.0-0 -y
    sudo apt-get install libproxy1-plugin-webkit -y
    sudo apt-get install libgnome-keyring0 -y
    local FILE_PATH=$HOME/Downloads/pulse.deb
    local DIR_WORKSPACE=$HOME/tools
    wget -O $FILE_PATH http://trial.pulsesecure.net/clients/ps-pulse-linux-9.0r4.0-b943-ubuntu-debian-64-bit-installer.deb
    sudo dpkg -i $FILE_PATH 
    rm $FILE_PATH
}

install_gradle() {
    sudo apt install gradle -y
}

install_jdk8() {
    sudo apt install openjdk-8-jdk -y
}

install_postman() {
    local FILE_PATH=$HOME/Downloads/postman.tar.gz
    local DIR_WORKSPACE=$HOME/tools
    wget -O $FILE_PATH https://dl.pstmn.io/download/latest/linux64
    if [ ! -d $DIR_WORKSPACE ]; then
            mkdir $DIR_WORKSPACE
    fi 
    tar -zxvf $FILE_PATH -C $DIR_WORKSPACE
    rm $FILE_PATH
}

donwload_icons() {

    local DIR_WORKSPACE=$HOME/workspace/icons
    if [ ! -d $DIR_WORKSPACE ]; then
            mkdir $DIR_WORKSPACE
    fi 
    wget -O $DIR_WORKSPACE"/VScode.png" https://klauslaube.com.br/images/blog/vscode-logo.png
    wget -O $DIR_WORKSPACE"/postman.png" https://miro.medium.com/max/630/1*fVBL9mtLJmHIH6YpU7WvHQ.png
}

install_zsh() {

    # install zsh
    sudo apt install zsh

    # install oh my zsh
    sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # install zsh plugins
    sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

    # write file .zshrc 
    cp ./configuration-files/zshrc ~/.zshrc

    #install dracula theme
    sudo apt-get install dconf-cli

    git clone https://github.com/dracula/gnome-terminal && cd gnome-terminal && sudo ./install.sh
    
    rm -rf ~/gnome-terminal
}

config_keyboard() {
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['']"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['']"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['']"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['']"
}

run() {

    echo "--"
    echo "BUSQUE UM CAFÉ BROTHER, ISTO PODE DEMORAR BASTANTE !! :p "
    echo "--"
    sleep 8s

    system_update
    install_chrome
    install_slack
    install_gnome
    install_git
    install_jdk11
    install_node
    install_vs_code
    install_intellij
    install_spotify
    install_docker
    install_pulse
    install_gradle
    install_jdk8
    install_postman
    install_npm
    config_keyboard
    donwload_icons
    install_zsh
}

run
if [ $? -eq 0 ]; then
echo 'Instalação finalizada com sucesso 8)'
echo 'User o bash: ( gnome-desktop-item-edit ~/Desktop/ --create-new ) para criar atalhos ao software como as IDEs :P'
else
echo 'Ocorreu erros durantes as instalações, verifique ai brother!'
fi