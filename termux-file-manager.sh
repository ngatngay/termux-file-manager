# termux file manager install script

MANAGER_DIR="$HOME/.local/share/file-manager"
MANAGER_ADDR="localhost:9753"
MANAGER_BIN="$HOME/bin/tfm"
MANAGER_FILE="https://github.com/ngatngay/file-manager/releases/latest/download/file-manager-full.zip"

apt update
apt install wget unzip php

mkdir -p ~/bin
mkdir -p $MANAGER_DIR
cd $MANAGER_DIR

wget $MANAGER_FILE -O file-manager.zip
unzip file-manager.zip
rm file-manager.zip

cat << EOF > $MANAGER_BIN
exec > /dev/null 2>&1
cd $MANAGER_DIR
nohup php -S $MANAGER_ADDR &> /dev/null &
xdg-open http://$MANAGER_ADDR
EOF

chmod +x $MANAGER_BIN

echo ""
echo "run tfm to start !!"

