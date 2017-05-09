echo "Unzipping Package... ;)"
# Getting current package Number
package="$1"
mkdir $HOME/Packages/temp/
mkdir $HOME/Desktop/GoliathBackendServer

tar -xzf $HOME/Packages/$package -C $HOME/Packages/temp/

echo "Copying SQL Data..."
echo "Enter MySQL  Password?..."
	mysql -u root -p login < $HOME/Packages/temp/mySqlData/backup_sql.sql

	echo "Installing backend.. how exciting -_-"
	cp -a -v $HOME/Packages/temp/it490_backend_final/* $HOME/Desktop/GoliathBackendServer/
echo "Adjusting RabbitMQ .ini..."
	sed -i '2s/.*/BROKER_HOST = 192.168.2.20/g' $HOME/Desktop/GoliathBackendServer/testRabbitMQ.ini
	sed -i '2s/.*/BROKER_HOST = 192.168.2.20/g' $HOME/Desktop/GoliathBackendServer/apiRabbitMQ.ini
echo "Backend Package Sucessfully Installed!"

