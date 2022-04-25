# 使用说明

> 由于红帽CL210 v13 版本，在CL210-RHOSP13.0-1.r2020013017-ILT+VT+ROLE+RAV-7-en_US.icmf中，
> IPA服务器证书问题，无法在2021-02-09之后使用，且更新新的course文件也多少有问题，因此使用重建IPA服务器来解决该问题

1. 使用相关命令确保当前的OpenStack集群正常运行。
   由讲师下载该项目文件到本地，并分发给学员
```bash
$ git clone https://gitee.com/linuxgeeker/rht-materials.git
```
2. 卸载现有的`ipa server`
```bash
$ ipa-server-install --uninstall -U
```

3. 重新按照下面命令部署IPA服务器
```bash
$ ipa-server-install -p RedHat123^ -a RedHat123^ \
  --ip-address=172.25.250.220 \
  -n lab.example.net \
  -r LAB.EXAMPLE.NET \
  --hostname=utility.lab.example.com \
  --mkhomedir -N  \
  --no-dns-sshfp \
  --reverse-zone=250.25.172.in-addr.arpa. \
  --no-dnssec-validation \
  --setup-dns \
  --no-forwarders \
  --idstart=229000000 -U

$ systemctl reboot
```

4. 将`utiltiy`中的`ipa`证书拷贝出来一份，并转换为PEM格式
```bash
$ scp root@utility:/etc/ipa/ca.crt /tmp/
$ openssl x509 -in /tmp/ca.crt -out /tmp/ca.pem -outform PEM
```

5. 将 `ca.crt` 拷贝至`controller`节点的 `/etc/ssl/certs`,将 `ca.pem`拷贝至`controller`节点的`/etc/pki/ca-trust/source/anchors/`
```bash
$ scp /tmp/ca.crt root@controller0:/var/lib/config-data/puppet-generated/keystone/etc/ssl/certs/
$ scp /tmp/ca.pem root@controller0:/var/lib/config-data/puppet-generated/keystone/etc/pki/ca-trust/source/anchors/
```
6. 在`controller`执行以下命令
```bash
$ update-ca-trust
```
7. 在`utility`中，执行以下命令重建用户和组账户信息
```bash
$ ./ipa_useradd.sh
```
如果您的`utility`节点可以连接互联网，您也可以执行

**通过curl命令**
```bash
$ bash -c "$(curl -fssL https://gitee.com/linuxgeeker/rht-materials/raw/master/cl210_v13/ipa_useradd.sh)"
```

**通过wget命令**
```bash
$ bash -c "$(wget https://gitee.com/linuxgeeker/rht-materials/raw/master/cl210_v13/ipa_useradd.sh -O -)"

