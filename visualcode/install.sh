pm=SPECIALPM

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or as root."
  exit 1
fi

echo "Package Manager $pm..."
if [ $pm == "apt" ]; then
echo -n "Downloading VSCode DEB... "
wget -O vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
echo "PASS"
sudo apt-get install ./vscode.deb
elif [ $pm == "dnf" ]; then
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update &&
sudo dnf install code

else
echo "Sorry, this OS ($pm) is not supported yet."
exit 1
fi
