DESIRED_SERVER=$1

cd "$DESIRED_SERVER"
java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot.jar
