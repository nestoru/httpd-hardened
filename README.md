# httpd - Hardening the Official docker image
See this sample docker-compose.yml to understand how to use this image:
```
httpd-hardened:
  image: 'httpd-hardened' 
  restart: always
  container_name: httpd-hardened 
  ports:
    - 80:80
    - 443:443
  volumes:
    - "/opt/data/app/certs/app.crt:/etc/ssl/app.crt"
    - "/opt/data/app/certs/app.key:/etc/ssl/app.key"
    - "/opt/data/app/certs/chain.crt:/etc/ssl/chain.crt"
    - "/opt/data/app/www:/var/www/html"
    - "/opt/data/app/sites-available/default.conf:/etc/apache2/sites-available/default.conf"
    - "/opt/data/app/sites-available/default-ssl.conf:/etc/apache2/sites-available/default-ssl.conf"
    - "/etc/timezone:/etc/timezone:ro"
```
## Some useful commands
Clone, build, tag and push
```
git clone git@github.com:nestoru/httpd-hardened.git
cd httpd-hardened 
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
docker rmi --force $(docker images -q)
docker build . -t nestoru/httpd-hardened:0.1
docker tag nestoru/httpd-hardened:0.1 nesetoru/httpd-hardened:0.1
docker push nestoru/httpd-hardened:0.1
```

Run, inspect logs, get into the container shell
```
docker logs httpd-hardened -f
docker exec -ti lamp-php-apache bash
docker exec -ti lms-apache tail -f  /var/log/apache2/error.log
```
