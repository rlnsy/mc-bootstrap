# Attempt to download and install latest build tools jar
# from URL, placed in a special directory
#
# See https://www.spigotmc.org/wiki/buildtools/#what-is-it
# for details on how to use
#
# Copyright © 2020 Rowan D. Lindsay
#

TOOLS_URL="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
INSTALL_DIR="installations"

ls "$INSTALL_DIR" > /dev/null
STATUS=$?
if [[ $STATUS != 0 ]]; then
	echo "[ERROR] Installation directory $INSTALL_DIR does not exist, create it plz :)"
	exit 1
fi
DATE=$(date +"%a_%b_%d_%T_%Z_%Y")
mkdir "$INSTALL_DIR/$DATE"
TOOLS_DIR="$INSTALL_DIR/$DATE/BuildTools"
mkdir "$TOOLS_DIR"
rm -rf "$INSTALL_DIR/latest" > /dev/null
STATUS=$?
if [[ $STATUS != 0 ]]; then
        echo "[INFO] No previous installations!"
fi
mkdir "$INSTALL_DIR/latest"

mkdir .tmp-build
cd .tmp-build
wget -O BuildTools.jar "$TOOLS_URL"
git config --global --unset core.autocrlf
java -jar BuildTools.jar --rev "latest"

cd ..
cp -r .tmp-build/* "$TOOLS_DIR/"
cp -r .tmp-build/* "$INSTALL_DIR/latest"

rm -rf .tmp-build

echo "All done ✅"

exit 0

