
# https://www.raspberrypi.org/downloads/raspbian/
# download the disk image (raspbian lite...), put onto a microSD card -- dd if={{image-file}} of=/dev/{{base-disk-identifier}} status=progress bs=4M
# don't resize the partitions, the pi will resize it upon boot

#sha256sum {{image-file}}

# manual setup via for at least the localization (also good for gpio & other header pin protocols)
# sudo raspi-config

## fix wifi
#cat <<EOF > /etc/wpa_supplicant/wpa_supplicant.conf
#country=US
#start_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
#update_config=1
#
#network={
#    ssid="{{WiFi SSID}}"
#    psk="{{WiFi Password}}"
#}
#EOF

#update the OS
sudo apt-get update && sudo apt-get -y upgrade

#install pulseaudio
#sudo apt-get install pulseaudio

# see existing soundcards
amixer

# disable the onboard soundcard
sudo cat <<EOF > /etc/modprobe.d/alsa-blacklist.conf
blacklist snd_bcm2835
EOF

# set USB soundcard as default
cat <<EOF > /etc/modprobe.d/snd-usb-audio.conf
options snd-usb-audio index=-2
EOF

# see the updated soundcard availability
amixer

# test the soundcard
aplay /usr/share/sounds/alsa/Front_Center.wav

# install the snowboy dependencies
sudo apt-get -y install python-pip python-pyaudio python3-pyaudio sox libatlas-base-dev libasound2-dev portaudio19-dev libportaudio0 alsa-utils

sudo apt-get -y swig3.0 git autoconf

# update pip
pip install --update pip





