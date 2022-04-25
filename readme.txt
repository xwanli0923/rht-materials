1. 卸载现有的ipa server
$ ipa-server-install --uninstall -U

2. 重新按照下面要求部署ipa服务器
$ ipa-server-install -p RedHat123^ -a RedHat123^ --ip-address=172.25.250.220 -n lab.example.net -r LAB.EXAMPLE.NET --hostname=utility.lab.example.com --mkhomedir -N  --no-dns-sshfp --reverse-zone=250.25.172.in-addr.arpa. --no-dnssec-validation --setup-dns --no-forwarders --idstart=229000000 -U

$ reboot

$ ipa-server-install -p RedHat123^ -a RedHat123^ --ip-address=172.25.250.220 -n lab.example.net -r LAB.EXAMPLE.NET --hostname=utility.lab.example.com --mkhomedir -N  -U

[student@workstation ~]$ scp root@utility:/etc/ipa/ca.crt /tmp/
[student@workstation ~]$ openssl x509 -in /tmp/ca.crt -out /tmp/ca.pem -outform PEM

[student@workstation ~]$ scp /tmp/ca.crt root@controller0:/var/lib/config-data/puppet-generated/keystone/etc/ssl/certs/
[student@workstation ~]$ scp /tmp/ca.pem root@controller0:/var/lib/config-data/puppet-generated/keystone/etc/pki/ca-trust/source/anchors/

[student@workstation ~]$ ssh root@controller0 "update-ca-trust"

openssl x509 -in ca.crt -out ca.pem -outform PEM
