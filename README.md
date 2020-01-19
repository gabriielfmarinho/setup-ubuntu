# setup-ubuntu
 
Script shell para atualização do sistema e instalação de system_update, chrome, slack, gnome, git, node, vs_code, intellij, spotify, docker, jdk11.

Para criar atalhos rodar o comando no bash: gnome-desktop-item-edit /usr/share/applications/ --create-new ou .local/share/applications/

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
