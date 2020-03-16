#!/bin/bash

system_update() {
    sudo apt update -y
    sudo apt upgrade -y
}

install_spotify() {
    sudo snap install spotify
}

install_chrome() {
    wget -O $HOME/Downloads/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i $HOME/Downloads/google-chrome.deb
    rm $HOME/Downloads/google-chrome.deb
    sudo apt install -y -f
}

install_slack() {
    wget -O $HOME/Downloads/slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.1-amd64.deb
    sudo dpkg -i $HOME/Downloads/slack.deb 
    rm $HOME/Downloads/slack.deb
    sudo apt install -y -f
}

install_gnome() {
    sudo apt-get install --no-install-recommends gnome-panel -y 
}

install_git() {
    cp ./configuration-files/gitconfig ~/.gitconfig
}

install_node() {
    sudo npm install -g n
    sudo n stable
}

install_npm() {
    sudo apt install npm -y 
}

install_vs_code() {
    wget -O $HOME/Downloads/vs_code.deb https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable
    sudo dpkg -i $HOME/Downloads/vs_code.deb
    rm $HOME/Downloads/vs_code.deb
    sudo apt install -y -f
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

install_jdk11() {
    sudo apt install openjdk-11-jdk -y
}

install_jdk12() {
    sudo apt install openjdk-12-jdk -y
}

install_jdk13() {
    sudo apt install openjdk-13-jdk -y
}

install_postman() {
    local DIR_WORKSPACE=$HOME/tools
    wget -O $HOME/Downloads/postman.tar.gz https://dl.pstmn.io/download/latest/linux64
    if [ ! -d $DIR_WORKSPACE ]; then
            mkdir $DIR_WORKSPACE
    fi 
    tar -zxvf $HOME/Downloads/postman.tar.gz -C $DIR_WORKSPACE
    rm $HOME/Downloads/postman.tar.gz
}

install_toolbox() {
    wget -O $HOME/Downloads/toolbox.tar.gz https://download-cf.jetbrains.com/toolbox/jetbrains-toolbox-1.16.6319.tar.gz
    local FILE_PATH=$HOME/tools
    if [ ! -d $FILE_PATH ]; then
        mkdir $FILE_PATH
    fi
    sudo tar -xzf $HOME/Downloads/toolbox.tar.gz -C $HOME/tools
    rm $HOME/Downloads/toolbox.tar.gz
}

donwload_icons() {
    local DIR_TOOLS=$HOME/tools/icons
    if [ ! -d $DIR_TOOLS ]; then
            mkdir $DIR_TOOLS
    fi 
    wget -O $DIR_TOOLS"/postman.png" https://miro.medium.com/max/630/1*fVBL9mtLJmHIH6YpU7WvHQ.png
}

config_keyboard() {
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['']"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['']"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['']"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['']"
}

install_zsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
    cp ./configuration-files/zshrc ~/.zshrc
}

install_dracula_theme() {
    git clone https://github.com/dracula/gnome-terminal
    local DIR_TOOLS=$HOME/workspace
    if [ ! -d $DIR_TOOLS ]; then
            mkdir $DIR_TOOLS
    fi 
    mv gnome-terminal $HOME/workspace
    sudo bash $HOME/workspace/gnome-terminal/install.sh -y
}

run() {

    echo "--"
    echo "BUSQUE UM CAFÉ BROTHER, ISTO PODE DEMORAR BASTANTE !! :p "
    echo "--"
    sleep 8s

    system_update
    install_zsh
    install_dracula_theme
    install_toolbox
    install_chrome
    install_slack
    install_gnome
    install_git
    install_jdk13
    install_jdk12
    install_jdk11
    install_jdk8
    install_node
    install_vs_code
    install_spotify
    install_docker
    install_pulse
    install_gradle
    install_postman
    install_npm
    config_keyboard
    donwload_icons
}

run
if [ $? -eq 0 ]; then
echo 'Instalação finalizada com sucesso 8)'
echo 'User o bash: ( gnome-desktop-item-edit ~/Desktop/ --create-new ) para criar atalhos ao software como as IDEs :P'
else
echo 'Ocorreu erros durantes as instalações, verifique ai brother!'
fi