#!/bin/bash
NICLIST="$(ip a | grep '^[[:digit:]]' | cut -d: -f2)"
NIC1=
NIC2=
NIC3=
for nic in ${NICLIST} ; do
    # Skip if loopback
    [[ "${nic}" == "lo" ]] && continue
    # Skip if not in /sys/class/net
    [[ ! -d /sys/class/net/${nic} ]] && continue
    # Skip if wireless
 #   [[ -d /sys/class/net/${nic}/wireless ]] && continue
#    grep 'DEVTYPE=wlan' /sys/class/net/${nic}/uevent &>/dev/null && continue
    # Skip if WWAN
    grep 'DEVTYPE=wwan' /sys/class/net/${nic}/uevent &>/dev/null && continue
    # Assess whether this NIC is up
    if grep 'up' /sys/class/net/${nic}/operstate &>/dev/null ; then
        # If NIC1 is already occupied, is it up?
        if [[ -n "${NIC1}" ]]; then
            if grep 'up' /sys/class/net/${NIC1}/operstate &>/dev/null ; then
                NIC2=${nic}
            else
                NIC2=${NIC1}
                NIC1=${nic}
            fi
        else
            #NIC1=${nic}
            NIC3=${nic}
        fi
    else
        # If NIC1 is already occupied, put it second
        if [[ -n "${NIC1}" ]]; then
            NIC2=${nic}
        else
            NIC1=${nic}
        fi
    fi
    # If we already have two NICs, break out
    [[ -n "${NIC2}" ]] && break
done

# above copy from foundation.ks file

echo ${NIC1}
echo ${NIC2}
echo ${NIC3}
read -p "Please enter the ethernet: " ETHERNET

echo  "Please enter gateway (default: 172.16.70.1)."
read -p "gateway(enter): " GATEWAY
if [[ -z ${GATEWAY} ]];then
	GATEWAY=172.16.70.1
else
	echo ""
fi

echo "Please enter IP Address: "
echo "eg: 172.16.70.200"
read -p "IP: " IP
sleep 2
ansible-playbook -e ETHERNET=${ETHERNET} -e external_gw=${GATEWAY} -e external_ip=${IP} site-standalone.yml

echo "your system changes take effect after reboot, whether to reboot immediately:"
read -p "'Yes' or 'NO' ? : " ANSWER
case "$ANSWER" in 
	Yes )
		echo "your system will be reboot in 3s"
		sleep 3 && systemctl reboot
		;;
	No )
		echo "please reboot your system manual"
		;;
esac
