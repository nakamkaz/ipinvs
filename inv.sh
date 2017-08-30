MGMTSRV=SERVERURL
MGMTSVC=inv
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:${PATH}
curl ${MGMTSRV}/invsend.sh | sh
#### crontab 
#### 0 */4 * * * sh /root/sendinv.sh
