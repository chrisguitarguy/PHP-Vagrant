###
# Run a bunch of apt-get commands to set up the server.
# Maybe a Chef recipe would be a better idea?
###

# Upgrade apt-get
apt-get update --force-yes -y

### MySQL ###
echo mysql-server mysql-server/root_password password root | sudo debconf-set-selections
echo mysql-server mysql-server/root_password_again password root | sudo debconf-set-selections
apt-get install --force-yes -y mysql-server

### cURL ###
apt-get install --force-yes -y curl

### PHP ###
apt-get install --force-yes -y php5 php5-curl php5-fpm php-pear php5-common php5-mcrypt php5-mysql php5-cli php5-gd php5-imagick
sudo mv /etc/php5/fpm/php.ini /etc/php5/fpm/php.ini.backup
sudo cp /srv/conf/php.ini /etc/php5/fpm
sudo mv /etc/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf.backup
sudo cp /srv/conf/www.conf /etc/php5/fpm/pool.d
sudo service php5-fpm restart

### nginx ###
apt-get install --force-yes -y nginx
sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
sudo cp /srv/conf/nginx.conf /etc/nginx
sudo cp /srv/conf/phpfcgi.conf /etc/nginx/conf.d
sudo service nginx restart

### Git ###
apt-get install --force-yes -y git-core

### Vim ###
apt-get install --force-yes -y vim

if [ -f "/vagrant/post-install.sql" ]; then
    mysql --user=root --password=root < /vagrant/post-install.sql
fi

ifconfig
