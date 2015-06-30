# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.

#https://github.com/rails/rails-dev-box
function install {
    echo installing $1
    shift
	yum -y install "$@"
	
	if [ $? != 0 ]; then
      printf "Error when installing '$1'"
      exit $ERROR_CODE
   fi
}

function uninstall {
    echo uninstalling $1
    shift
	yum -y erase "$@"
}

echo updating package information
#yum -y update >/dev/null 2>&1

#install 'development tools' build-essential

echo installing ruby, rails, bundler, etc
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby --rails
source /usr/local/rvm/scripts/rvm

install Git git
#install SQLite sqlite3 libsqlite3-dev
#install memcached memcached
#install Redis redis-server
#install RabbitMQ rabbitmq-server

#uninstall MariaDB mariadb-server mariadb mariadb-libs mariadb-devel
install MariaDB mariadb-server mariadb mariadb-libs mariadb-devel
systemctl start mariadb
#mysql_secure_installation
systemctl enable mariadb.service

#debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
#debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

#CREATE USER 'rails'@'localhost';

mysql -uroot <<SQL
GRANT ALL PRIVILEGES ON *.* to 'rails'@'localhost';
USE mysql;
UPDATE user SET PASSWORD=PASSWORD("rails") WHERE User='rails';
flush privileges;
quit
SQL

#install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
install 'EPEL Repository' epel-release
install 'ExecJS runtime' nodejs

# Needed for docs generation.
#update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
cd /vagrant
bundle install

echo 'all set, rock on!'