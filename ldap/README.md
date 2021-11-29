

### 安装
* https://www.liuwg.com/archives/docker-openldap

```
docker pull osixia/openldap

docker pull osixia/phpldapadmin
```

```
docker run \
-p 389:389 \
-p 636:636 \
--name myldap_name \
--network bridge \
--hostname openldap-host \
--env LDAP_ORGANISATION="mycompany" \
--env LDAP_DOMAIN="mycompany.com" \
--env LDAP_ADMIN_PASSWORD="wangh" \
--detach osixia/openldap

```

```
docker run \
-d \
--privileged \
-p 8081:80 \
--name myldapadmin \
--env PHPLDAPADMIN_HTTPS=false \
--env PHPLDAPADMIN_LDAP_HOSTS=150.158.52.34 \
--detach osixia/phpldapadmin
```
