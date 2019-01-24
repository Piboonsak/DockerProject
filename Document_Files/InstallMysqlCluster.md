# InstallMysqlCluster

ref link : https://quay.io/repository/bitnami/mysql

## Use compose file

```yml
version: '3'

services:
  mysql-master:
    image: 'bitnami/mysql:latest'
    environment:
      - ALLOW_EMPTY_PASSWORD=yes
    ports:
      - '3306'
    volumes:
      - 'mysql_master_data:/bitnami/mysql'
    environment:
      - MYSQL_REPLICATION_MODE=master
      - MYSQL_REPLICATION_USER=repl_user
      - MYSQL_REPLICATION_PASSWORD=repl_password
      - MYSQL_ROOT_PASSWORD=master_root_password
      - MYSQL_USER=my_user
      - MYSQL_PASSWORD=my_password
      - MYSQL_DATABASE=my_database
    volumes:
      - '/path/to/mysql-persistence:/bitnami/mysql'
  mysql-slave:
    image: 'bitnami/mysql:latest'
    environment:
      - ALLOW_EMPTY_PASSWORD=yes
    ports:
      - '3306'
    depends_on:
      - mysql-master
    environment:
      - MYSQL_REPLICATION_MODE=slave
      - MYSQL_REPLICATION_USER=repl_user
      - MYSQL_REPLICATION_PASSWORD=repl_password
      - MYSQL_MASTER_HOST=mysql-master
      - MYSQL_MASTER_PORT_NUMBER=3306
      - MYSQL_MASTER_ROOT_PASSWORD=master_root_password
```

## Scale the number of slaves using:

`docker stack deploy scale mysql-master=1 mysql-slave=3`
      