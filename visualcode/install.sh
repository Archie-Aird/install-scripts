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
else
echo "Sorry, this OS ($pm) is not supported yet."
exit 1
fi
