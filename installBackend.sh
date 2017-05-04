echo "Unzippin Package... ;)"
# Getting current package Number
packageNum=`php /home/matt/git/rabbitmqphp_example_deployTest/testRabbitMQClient.php currentPackage backendPackage.tar.gzi | xargs`

tar -xzf $HOME/Packages/backendPackage-v"$packageNum".tar.gz -C /home/uziar/Packages/backend/

echo "Copying SQL Data..."
echo "Enter MySQL  Password?..."
	mysql -u root -p login < $HOME/Packages/backend/backendPackage-v"$packageNum"/mySqlData/backup_sql.sql

mkdir /home/uzair/Desktop/GoliathBackend

echo "Installing backend.. how exciting -_-"
mv $HOME/Packages/backend/backendPackage-v"$packageNum"/it1490_backend_final $HOME/Desktop/GoliathBackend/

echo "Backend Package Sucessfully Installed!"

