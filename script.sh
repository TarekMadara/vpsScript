#sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
apt-get update && apt-get install -y gnupg
touch /etc/apt/sources.list.d/debian.list
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/debian-buster.gpg] http://deb.debian.org/debian buster main' >> /etc/apt/sources.list.d/debian.list
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/debian-buster-updates.gpg] http://deb.debian.org/debian buster-updates main' >> /etc/apt/sources.list.d/debian.list
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/debian-security-buster.gpg] http://deb.debian.org/debian-security buster/updates main' >> /etc/apt/sources.list.d/debian.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DCC9EFBF77E11517
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A
apt-key export 77E11517 | gpg --dearmour -o /usr/share/keyrings/debian-buster.gpg
apt-key export 22F3D138 | gpg --dearmour -o /usr/share/keyrings/debian-buster-updates.gpg
apt-key export E562B32A | gpg --dearmour -o /usr/share/keyrings/debian-security-buster.gpg
touch /etc/apt/preferences.d/chromium.pref
# Note: 2 blank lines are required between entries
echo 'Package: *' >> /etc/apt/preferences.d/chromium.pref
echo 'Pin: release a=eoan' >> /etc/apt/preferences.d/chromium.pref
echo 'Pin-Priority: 500' >> /etc/apt/preferences.d/chromium.pref

echo 'Package: *' >> /etc/apt/preferences.d/chromium.pref
echo 'Pin: origin "deb.debian.org"' >> /etc/apt/preferences.d/chromium.pref
echo 'Pin-Priority: 300' >> /etc/apt/preferences.d/chromium.pref

# Pattern includes 'chromium', 'chromium-browser' and similarly
# named dependencies:
echo 'Package: chromium*' >> /etc/apt/preferences.d/chromium.pref
echo 'Pin: origin "deb.debian.org"' >> /etc/apt/preferences.d/chromium.pref
echo 'Pin-Priority: 700' >> /etc/apt/preferences.d/chromium.pref
export DEBIAN_FRONTEND=noninteractive
apt update
apt install -yq curl
apt install -yq chromium
apt install -yq python3-pip
apt install -yq xfce4 xrdp
