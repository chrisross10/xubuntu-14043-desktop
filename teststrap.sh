echo "<<<<<<< UPDATING PACKAGE INFORMATION >>>>>>>"
sudo apt-get -y update >/dev/null 2>&1

echo "<<<<<<< INSTALLING JDK >>>>>>>"
sudo apt-get -y install openjdk-7-jdk

echo "<<<<<<< INSTALLING CLOJURE >>>>>>>"
wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -v -O /usr/bin/lein
sudo chmod 755 /usr/bin/lein
lein self-install

