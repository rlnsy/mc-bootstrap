NAME=$1
JARF=$2
if [[ -z "$NAME" ]] || [[ -z "$JARF" ]]; then
	echo "Usage: make-server <name> <path to jar>"
	exit 1
elif [[ ! -d "servers" ]]; then
	echo "[ERROR] You appear to be missing the server directory"
	exit 1
elif [[ -f "servers/$NAME" ]]; then
	echo "[ERROR] A server with that name already exists"
	exit 1
elif [[ ! -f "$JARF" ]]; then
	echo "[ERROR] Invalid Spigot jar specified ($JARF)"
	exit 1
else
	echo "Creating server \"$NAME\" from $JARF..."
	mkdir "servers/$NAME"
	cp "$JARF" "servers/$NAME/spigot.jar"
	echo "Done"
fi
