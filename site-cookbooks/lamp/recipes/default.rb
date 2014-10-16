#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright 2014, Tatsuya Itai
#
# All rights reserved - Do Not Redistribute
execute "yum-update" do
    command "yum update -y"
end

execute "get RHEL 6.x" do
        command "rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm"
end

packages = %w{
    git
    vim
    zsh
    httpd
    mod_ssl
    php
    php-pdo
    php-common
    php-xml
    php-mysql
    php-pgsql
    php-cli
    php-fpm
    php-pear
    php-dom
    php-soap
    php-gd
    php-devel
    php-pecl-xdebug
    php-mbstring
    mysql
    mysql-server
    postgresql
    nodejs
    npm
    curl}

packages.each do |pkg|
    package pkg do
        action [:install, :upgrade]
    end
end

execute "composer-install" do
    command "curl -sS https://getcomposer.org/installer | php ;mv composer.phar /usr/local/bin/composer"
    not_if { ::File.exists?("/usr/local/bin/composer")}
end

execute "ag-install" do
    command "rpm -ivh http://swiftsignal.com/packages/centos/6/x86_64/the-silver-searcher-0.13.1-1.el6.x86_64.rpm"
end

execute "coffeescript-install" do
    command "npm install -g coffee-script"
end

%w{gcc make wget telnet readline-devel ncurses-devel gdbm-devel openssl-devel zlib-devel libyaml-devel}.each do |p|
    package p do
        action :install
    end
end

%w{mysqld httpd}.each do |service_name|
    service service_name do
        action [:enable, :start]
        supports :status => true, :restart => true, :reload => true
    end
end#
