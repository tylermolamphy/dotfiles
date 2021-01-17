#!/bin/sh
/root/dotfiles/yum/install-mysql-bare.sh
yum install nginx phpmyadmin php-fpm php-cli php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc php-eaccelerator php-magickwand php-magpierss php-mbstring php-mcrypt php-mssql php-shout php-snmp php-soap php-tidy -y
chown -R nginx:nginx /usr/share/phpMyAdmin/
sed -i '40,46 s/#//g' /etc/nginx/conf.d/default.conf
replace "/usr/share/nginx/html" "/usr/share/phpMyAdmin/" -- /etc/nginx/conf.d/default.conf
replace "index  index.html index.htm;" "index  index.php;" -- /etc/nginx/conf.d/default.conf
replace "root           html;" "root           /usr/share/phpMyAdmin/;" -- /etc/nginx/conf.d/default.conf
replace "fastcgi_param  SCRIPT_FILENAME  /script$fastcgi_script_name;" "fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;" -- /etc/nginx/conf.d/default.conf
replace ";cgi.fix_pathinfo=1" "cgi.fix_pathinfo=0" -- /etc/php.ini
replace ";date.timezone =" "date.timezone = America/New_York" -- /etc/php.ini
replace "user = apache" "user = nginx" -- /etc/php-fpm.d/www.conf
replace "group = apache" "group = nginx" -- /etc/php-fpm.d/www.conf
service mysqld restart
service nginx start
service php-fpm start
