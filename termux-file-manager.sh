# termux file manager install script

MANAGER_DIR="$PREFIX/opt/file-manager"
MANAGER_ADDR="localhost:9753"
MANAGER_BIN="$PREFIX/bin/tfm"
MANAGER_FILE="https://github.com/ngatngay/file-manager/archive/main.zip"

apt update
apt install wget unzip php

mkdir -p $PREFIX/opt
cd $PREFIX/opt

wget $MANAGER_FILE -O file-manager.zip
unzip file-manager.zip
rm file-manager.zip

rm -rf $MANAGER_DIR
mv file-manager-main $MANAGER_DIR

cat << EOF > $MANAGER_BIN
cd $MANAGER_DIR
nohup php -S $MANAGER_ADDR &> /dev/null &
xdg-open http://$MANAGER_ADDR
EOF

chmod +x $MANAGER_BIN

echo ""
echo "run tfm to start !!"

