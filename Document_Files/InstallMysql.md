#

##

```yml
version: '3.3'

services:

  mysql:
    image: mysql:5.7
    environment:
      MYSQL_USER: root
      MYSQL_PASSWORD: password
    ports:
      - '23306:3306'
    volumes:
      - '/var/lib/docker/volumes/mysql/_data:/var/lib/mysql'

# Help!
##  Cli find mysql Database.
### mysql -uUSER -p -e 'SHOW VARIABLES WHERE Variable_Name LIKE "%dir"'
### data store path : /var/lib/mysql/
#
#
#
```

## Cli run

`docker stack deploy -c mysqlStack.yml mysql`