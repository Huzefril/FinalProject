
## Docker Advanced - Final Project


### Cara menjalankan di local development

- clone project nya dahulu 

git clone 


- execute perintah docker-compose

docker-compose up

- modifikasi is file /etc/hosts sesuai dengan domain yang ingin dites

misalnya kalau di windows lokasinya di : C:\windows\system32\drivers\etc\host

kita tambahkan 2 baris :

127.0.0.1 www.huzefril.local
127.0.0.1 pma.huzefril.local

Baris pertama untuk mapping host dengan IP untuk menampilkan website pesbuk.
Baris kedua untuk mapping host dengan IP untuk menampilkan PHP My Admin.


### Base image yang terlibat :

mysql:5.7
nginx:1.15.6
php:7.2-apache
phpmyadmin/phpmyadmin:4.8.3


### Langkah-langkah pengerjaan


#### Bikin 3 file docker dengan konsep simple compose design :

- docker-compose.yml   --> untuk menyimpan base image 
- docker-compose.override.yml --> untuk menyimpan informasi terkait build di local
- docker-compose-stack.yml --> untuk deployment ke production dengan nama myweb-app


