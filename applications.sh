. /etc/os-release # get system details for linux name

if [ $ID == "ubuntu" ] # start if for ubuntu
then
    echo "start for first installation"
    sudo apt-get install git curl docker docker-compose 
    echo "finish for first installation"

    echo "start for spotify"
    curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update && sudo apt-get install spotify-client
    echo "finish for spotify"

    echo "start for chrome"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt-get install -f #deb dosya  kurulumundan sonraki bağımlılıkları indirir
    sudo rm -rf google-chrome-stable_current_amd64.deb
    echo "finish for chrome"

    echo "start jetbrains toolbox"
    sudo rm -rf jetbrains-toolbox.sh.*
    wget https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh
    chmod +x jetbrains-toolbox.sh
    ./jetbrains-toolbox.sh
    sudo rm -rf jetbrains-toolbox.sh*
    echo "finish jetbrains toolbox"

    echo "start gnome-tweak-tools"
    sudo add-apt-repository universe
    sudo apt install gnome-tweak-tool
    sudo apt-get update
    echo "finish gnome-tweak-tools"

    echo "start sublimetext"
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update && sudo apt-get install sublime-text
    echo "finish sublimetext"

    echo "start anaconda"
    sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
    cd /tmp
    curl -O https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
    bash Anaconda3-2020.02-Linux-x86_64.sh
    source ~/.bashrc
    conda list
    conda create --name my_env python=3
    conda activate my_env
    echo "finish anaconda"

    echo "start opera"
    wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
    sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
    sudo apt install opera-stable
    sudo apt-get update
    echo "finish opera"

    echo "start Teamviever"
    wget https://dl.teamviewer.com/download/linux/version_15x/teamviewer_15.5.3_amd64.deb




elif [ $2 == 'centos' ]
then
    echo "start for first installation"
    sudo yum install git docker docker-compose 
    echo "finish for first installation"

    echo "start for spotify"
    #sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
    #echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo yum update
    sudo yum install spotify-client
    echo "finish for spotify"

    echo "start for chrome"
    #wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    #sudo dpkg -i google-chrome-stable_current_amd64.deb
    #sudo apt-get install -f #deb dosya  kurulumundan sonraki bağımlılıkları indirir
    #sudo rm -rf google-chrome-stable_current_amd64.deb
    echo "finish for chrome"
fi

echo "start for docker usermod"
sudo usermod -aG docker $USER
echo "finish for docker usermod"

git clone https://gitlab.com/onuragtas/docker.git
cd docker
cp docker-compose.yaml.dist docker-compose.yaml