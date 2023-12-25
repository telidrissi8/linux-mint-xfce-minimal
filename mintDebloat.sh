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
echo -e "yes\nyes\nno" | sudo apt-get purge firefox* || true

# Other
echo -e "yes\nyes\nno" | sudo apt-get purge rhythmbox* || true
echo -e "yes\nyes\nno" | sudo apt-get purge hexchat* || true
echo -e "yes\nyes\nno" | sudo apt-get purge thunderbird* || true
echo -e "yes\nyes\nno" | sudo apt-get purge transmission* || true
echo -e "yes\nyes\nno" | sudo apt-get purge simple-scan* || true
echo -e "yes\nyes\nno" | sudo apt-get purge sticky* || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge snapd || true
echo -e "yes\nyes\nno" | sudo apt-mark hold snapd || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge xfburn || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge gimp || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge parole || true

echo -e "yes\nyes\nno" | sudo apt autoremove --purge warpinator || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge webapp-manager || true
echo -e "yes\nyes\nno" | sudo apt autoremove --purge hypnotix || true

sudo apt-get clean || true
sudo apt-get autoremove || true

echo -e "yes\nyes\nno" | sudo apt-get install deborphan || true
echo -e "yes\nyes\nno" | sudo apt-get install bleachbit || true

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
echo -e "\n" | apt install ./google-chrome-stable_current_amd64.deb
rm -f ./google-chrome-stable_current_amd64.deb

while [ -n "`deborphan`" ]; do
    deborphan
    echo -e "yes\nyes\nno" | sudo apt purge `deborphan`
done


# Loop through all provided parameters
while [ "$#" -gt 0 ]; do
    param="$1"

    # Execute a specific portion of code based on the parameter
    case "$param" in
        laptop)
            	echo "Executing code for laptop mode..."
            	echo -e "yes\nyes\nno" | sudo apt-get install tlp || true
		echo -e "yes\nyes\nno" | sudo apt-get install powertop || true
            ;;

        dev)
            	echo "Executing code for dev mode..."
            	flatpak install flathub -y org.gnome.meld
	    	flatpak install flathub org.geany.Geany
		flatpak install flathub -y com.visualstudio.code
            ;;

        *)
            	echo "Invalid parameter: $param. Please use 'laptop' or 'dev'."
            	exit 1
            ;;
    esac

    # Shift to the next parameter
    shift
done

flatpak install flathub -y io.gitlab.librewolf-community
