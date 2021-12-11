Per recuperare ip di sonarqube in locale eseguire il comando da bash

```shell
docker inspect sonarqube-benzapp | grep IPAddress
```
172.17.0.2

```shell
docker run  `
    --rm `
    -e SONAR_HOST_URL="http://172.17.0.2:9000" `
    -e SONAR_LOGIN="fd51836a42d5aac17fec26008865768764dae146" `
    -v "${PWD}:/usr/src" `
    sonarsource/sonar-scanner-cli:4.6
```

```shell
docker run  --rm -e SONAR_HOST_URL="http://172.17.0.2:9000" -e SONAR_LOGIN="fd51836a42d5aac17fec26008865768764dae146" -v "${PWD}:/usr/src" sonarsource/sonar-scanner-cli:4.6
```
