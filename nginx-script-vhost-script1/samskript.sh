#!/bin/bash

#Установка NGINX...
apt-get update
apt-get upgrade
apt install nginx

#Копирование готовых папок с конфигом index.html для web /var/www...
cp -r index-html/* /var/www/mysite.ru/

#Копирование конфиг файлов...
cp -r sites-available/* /etc/nginx/sites-available

#Создание линка,для активации виртуальных хостов...
ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

#Редактирование файла /etc/hosts (добавление ip и domain)...
echo 192.168.0.110 www.mytasksite1.ru mytasksite1.ru >> /etc/hosts
echo 192.168.0.110 www.mytasksite2.ru mytasksite2.ru >> /etc/hosts
echo 192.168.0.110 www.mytasksite3.ru mytasksite3.ru >> /etc/hosts
echo 192.168.0.110 www.mytasksite4.ru mytasksite4.ru >> /etc/hosts
echo 192.168.0.110 www.mytasksite5.ru mytasksite5.ru >> /etc/hosts

#Добавление файлов для использования обратного прокси...
cp nginx-conf.d/* /etc/nginx/conf.d

#Перезагрузка NGINX...
service nginx restart

echo Скрипт завёршен!
