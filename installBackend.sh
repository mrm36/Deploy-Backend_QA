echo "Unzipping Package... ;)"
# Getting current package Number
packageNum=`php currentPackage.php | xargs`

tar -xzf $HOME/Packages/backendPackage-v"$packageNum".tar.gz -C $HOME/Packages

echo "Copying SQL Data..."
echo "Enter MySQL  Password?..."
	mysql -u root -p login < $HOME/Packages/backendPackage-v"$packageNum"/mySqlData/backup_sql.sql

mkdir $HOME/Desktop/GoliathBackendServer
	echo "Installing backend.. how exciting -_-"
	mv $HOME/Packages/backendPackage-v"$packageNum"/it1490_backend_final $HOME/Desktop/GoliathBackend/

echo "Backend Package Sucessfully Installed!"

