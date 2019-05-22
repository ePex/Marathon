# deploy to local tomcat
mkdir -p web/tomcat-port-9090/webapps
cp ../target/marathon.war web/tomcat-port-9090/webapps/.

# ensure the application has all their technical requirements met (here for photo scanning and display)
mkdir -p ~/marathonImages
mkdir -p ~/marathonScripts
cp ../src/main/java/demo/util/default.png ~/marathonImages/default.png
cp ../src/main/java/demo/antivirus/scanFile.sh ~/marathonScripts/scanFile.sh
chmod 755 ../src/main/java/demo/antivirus/scanFile.sh

# start the local database and tomat
cd db/hsqldb/bin/
pwd
./startMarathonDB.sh &
sleep 2
cd ../../../
mkdir -p web/tomcat-port-9090/logs
cd web/tomcat-port-9090/bin/
unset CATALINA_HOME
pwd
./startup.sh
cd ../../../