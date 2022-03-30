FROM nginx:1.15.6

HEALTHCHECK CMD curl -f http://localhost/ || exit 1
