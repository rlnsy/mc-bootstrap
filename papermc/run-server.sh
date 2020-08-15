DESIRED_SERVER=$1

cd "$DESIRED_SERVER"
java -Xms2G -Xmx2G -jar paper.jar
