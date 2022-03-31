
## Docker Advanced - Final Project
### Pendahuluan

Repository ini terdiri dari file-file yang dibutuhkan untuk menjalankan tugas Final Project - Docker Advanced.

Struktur directory :

```
FinalProject
|
│   README.md
│   docker-compose.yml             --> basic compose .yml file untuk Simple  Compose Design
|   docker-compose.override.yml    --> konfigurasi docker compose untuk dijalankan di local
│   docker-compose-stack.yml       --> konfigurasi docker stack untuk dijalankan di Production   
|
└─── dockerfile
│    │   mysql.Dockerfile       --> dockerfile untuk build image mysql
│    │   pma.Dockerfile         --> dockerfile untuk build image phpmyadmin
|    |   web.Dockerfile         --> dockerfile untuk build image php
|    |   proxy.Dockerfile       --> dockerfile untuk build image nginx  
│   
└─── secrets
|    │   mysql_root_pass.txt    --> root password untuk msql
|    │   mysql_database.txt     --> nama database untuk dipakai di final project ini
│    |   mysql_user.txt         --> nama user database untuk dipakai dari aplikasi php
|    │   mysql_user_pass.txt
│   
└─── bind-mount
|    │   nginx.conf
│   
└─── database
|    │   dump.sql

```

### Cara menjalankan di local development

1. clone project nya dahulu <br/>       
git clone https://github.com/Huzefril/FinalProject.git

2. execute perintah docker-compose

docker-compose up -d

3. modifikasi is file /etc/hosts sesuai dengan domain yang ingin dites

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


