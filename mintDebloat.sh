#!/bin/bash -e

# Uninstall libreoffice
echo -e "yes\nyes\nno" | sudo apt-get remove --purge libreoffice* || true
echo -e "yes\nyes\nno" | sudo apt-get remove --purge libuno* || true
echo -e "yes\nyes\nno" | sudo apt-get remove --purge hyphen* || true
echo -e "yes\nyes\nno" | sudo apt-get remove --purge ure* || true
echo -e "yes\nyes\nno" | sudo apt-get remove --purge opensymbol* || true
echo -e "yes\nyes\nno" | sudo apt-get remove --purge hunspell* || true
echo -e "yes\nyes\nno" | sudo apt-get remove --purge mythes* || true

echo -e "yes\nyes\nno" | sudo apt-get purge compiz* || true
echo -e "yes\nyes\nno" | sudo apt-get purge metacity* || true
echo -e "yes\nyes\nno" | sudo apt-get purge compton* || true

# Uninstall firefox
echo -e "yes\nyes\nno" | sudo apt-get purge firefox*

# Other
echo -e "yes\nyes\nno" | sudo apt-get purge rhythmbox* || true
echo -e "yes\nyes\nno" | sudo apt-get purge celluloid* || true
echo -e "yes\nyes\nno" | sudo apt-get purge hexchat* || true
echo -e "yes\nyes\nno" | sudo apt-get purge thunderbird* || true
echo -e "yes\nyes\nno" | sudo apt-get purge transmission* || true
echo -e "yes\nyes\nno" | sudo apt-get purge simple-scan* || true
echo -e "yes\nyes\nno" | sudo apt-get purge sticky* || true
echo -e "yes\nyes\nno" | sudo apt-get purge "*flatpak*" || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge snapd || true
echo -e "yes\nyes\nno" | sudo apt-mark hold snapd || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge xfburn || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge remmina || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge gimp || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge parole || true

echo -e "yes\nyes\nno" | sudo apt autoremove --purge warpinator || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge webapp-manager || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge hypnotix || true

sudo apt-get clean || true
sudo apt-get autoremove || true

echo -e "yes\nyes\nno" | sudo apt-get install vlc || true
echo -e "yes\nyes\nno" | sudo apt-get install deborphan || true
echo -e "yes\nyes\nno" | sudo apt-get install bleachbit || true
echo -e "yes\nyes\nno" | sudo apt-get install tlp || true
echo -e "yes\nyes\nno" | sudo apt-get install powertop || true
echo -e "yes\nyes\nno" | sudo apt install sublime-text || true

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
echo -e "\n" | apt install ./google-chrome-stable_current_amd64.deb
rm -f ./google-chrome-stable_current_amd64.deb

# nodeJs
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
echo -e "yes\nyes\nno" | sudo apt-get install -y nodejs || true

# vscode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

#git
echo -e "yes\nyes\nno" | sudo apt install git || true
ssh-keygen
cat ~/.ssh/id_rsa.pub
read -p "Please add the pub key to gitlab." yn

