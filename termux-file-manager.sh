# termux file manager install script

MANAGER_DIR="$HOME/.termux-file-manager"
MANAGER_ADDR="localhost:9753"
MANAGER_BIN="$PREFIX/bin/tfm"
MANAGER_FILE="https://github.com/ngatngay/file-manager/archive/main.zip"

apt update
apt install wget unzip php

mkdir -p $MANAGER_DIR

wget $MANAGER_FILE -O $MANAGER_DIR/manager.zip
cd $MANAGER_DIR
unzip manager.zip

cat << EOF > $MANAGER_BIN
cd $MANAGER_DIR/file-manager-main/
nohup php -S $MANAGER_ADDR &> /dev/null &
xdg-open http://$MANAGER_ADDR
EOF

chmod +x $MANAGER_BIN

echo ""
echo "run tfm to start !!"
