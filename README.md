
## Docker Advanced - Final Project
### Pendahuluan

Repository ini terdiri dari file-file yang dibutuhkan untuk menjalankan tugas Final Project - Docker Advanced.

### Base image yang terlibat :

- mysql:5.7
- nginx:1.15.6
- php:7.2-apache
- phpmyadmin/phpmyadmin:4.8.3

### Struktur directory :

```
FinalProject
|
│   README.md
│   docker-compose.yml             --> basic compose .yml file berdasarkan konsep `Simple Compose Design`
|   docker-compose.override.yml    --> konfigurasi docker compose untuk dijalankan di local
│   docker-compose-stack.yml       --> konfigurasi docker stack untuk dijalankan di Production   
|   wait-for-it.sh                 --> fungsi wrapper untuk Healthcheck koneksi TCP , berguna misalnya untuk cek koneksi mysql 3306
|                                      (https://github.com/vishnubob/wait-for-it), tapi diproject ini belum saya implement.
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
│    |   mysql_user.txt         --> nama user database yang dipakai untuk koneksi dari aplikasi php/web
|    │   mysql_user_pass.txt    --> password user yang dipakai untuk koneksi dari dari aplikasi php/web
│   
└─── bind-mount
|    │   nginx.conf             --> file konfigurasi nginx yang dipetakan dengan cara bind mount
│   
└─── database
|    │   dump.sql               --> inisiasi DML / DDL ke database setelah container mysql terbentuk
│   
└─── file-web
|    │   ......                 --> folder web php yang dipetakan dengan cara bind volume
```

### Cara menjalankan di local development

#### Persiapan

1. Pastikan komputer local sudah terinstall docker, baik Docker Desktop pakai W2SL atau pakai Virtualisasi lainnya.
2. Modifikasi is file /etc/hosts sesuai dengan domain yang ingin dites sesuai requirement.
   - misalnya kalau di windows lokasinya di : C:\windows\system32\drivers\etc\host
   - tambahkan mapping ip localhost dengan nama domain yang diinginkan di file tersebut.
     - `127.0.0.1 www.huzefril.local`
     - `127.0.0.1 pma.huzefril.local`
   - Baris pertama untuk mapping host dengan IP untuk menampilkan website pesbuk.
   - Baris kedua untuk mapping host dengan IP untuk menampilkan web PHP My Admin.

#### Eksekusi

1. clone project nya dahulu      
   - `git clone https://github.com/Huzefril/FinalProject.git`

2. execute perintah docker-compose
   - `docker-compose up -d`

3. tunggu sampai semua service up.
   - bisa dengan perintah cek : `docker service ls`
   - bisa cek juga melalui Docker Desktop
   
#### Test

1. Akses dari browser : `http://www.huzefril.local` , untuk mengecek web pesbuk berhasil dideploy di local.
2. Akses dari browser : `http://pma.huzefril.local` , untuk mengecek web phpmyadmin berhasil dideploy di local.


### Cara menjalankan di server production / GCP (Google Cloud Platform)

#### Persiapan

1. Pastikan sudah mempunyai account GCP
2. Buat 3 instance dari GCP Compute Engine yang masing-masingnya diinstall docker.
3. Jadikan 3 instance itu dalam mode Docker swarm, dan ketiga-tiganya sebagai Node Manager.

#### Eksekusi

1. Login SSH ke instance-1

2. clone project nya dahulu      
   - `git clone https://github.com/Huzefril/FinalProject.git`

2. execute perintah docker stack deploy dengan nama stack : myweb-app
   - `docker stack deploy -c docker-compose.yml -c docker-compose-stack.yml myweb-app`

3. tunggu sampai semua service up.
   - bisa dengan perintah cek : `docker service ls`
   
#### Test (TBA)

1. Akses dari browser : `http://www.huzefril.local` , untuk mengecek web pesbuk berhasil dideploy di Production
2. Akses dari browser : `http://pma.huzefril.local` , untuk mengecek web phpmyadmin berhasil dideploy di Production


### Langkah-langkah pengerjaan


#### Bikin 3 file docker dengan konsep simple compose design :

- docker-compose.yml   --> untuk menyimpan base image 
- docker-compose.override.yml --> untuk menyimpan informasi terkait build di local
- docker-compose-stack.yml --> untuk deployment ke production dengan nama myweb-app


