FROM phpmyadmin/phpmyadmin:4.8.3

HEALTHCHECK CMD curl -f http://localhost/ || exit 1
