MGMTSRV=YOURURL
MGMTSVC=inv
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:${PATH}
nodename=$(uname -n)
nodeipaddrs=$(ip addr show | awk '$0~/inet .*global/{printf("%s,",$2)}')
echo "SEND: " $nodename "has" $nodeipaddrs
curl ${MGMTSRV}/${MGMTSVC} --get --data nodename=${nodename} --data nodeipaddrs=${nodeipaddrs} --data systype=$(uname -s)
