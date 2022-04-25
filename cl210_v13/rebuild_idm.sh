
#!/bin/bash

ipa-server-install --uninstall -U

ipa-server-install -p RedHat123^ -a RedHat123^ \
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

systemctl reboot