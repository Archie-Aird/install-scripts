packageman=$SPECIAL:PM
distro=$SPECIAL:DS

echo "Test pass!"
echo "You are on $distro using $packageman"
echo "Stuff package manager is perfectly fine. Enter a password (its swordfish): "
read password
if [ $password == "swordfish" ]; then
  echo "yay! $password is the password!"
  exit 0
else
  echo "noooooo"
  exit 1
fi
