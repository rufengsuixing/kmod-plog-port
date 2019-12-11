**** kmod-plog-port
openwrt kernel mod 用于记录连接指定端口的进程
```
insmod kmod-plog-port.ko
echo 53 > /proc/sys/net/ipv4/udp_port_connection
dmesg
```
result
```
[94218.596595] UDP : pid = 13507, comm = curl
[94218.601109] UDP : pid = 13507, comm = curl
[94218.605081] UDP : pid = 5306, comm = dnsmasq
[94218.610451] UDP : pid = 5306, comm = dnsmasq
[94224.620646] UDP : pid = 13954, comm = ssr-check
[94239.602064] UDP : pid = 5306, comm = dnsmasq
[94239.607207] UDP : pid = 5306, comm = dnsmasq
[94281.638953] UDP : pid = 14153, comm = curl
[94281.643680] UDP : pid = 14153, comm = curl
[94281.650560] UDP : pid = 5306, comm = dnsmasq
[94281.656207] UDP : pid = 5306, comm = dnsmasq
[94282.695884] UDP : pid = 12024, comm = AdGuardHome
[94282.702671] UDP : pid = 12073, comm = AdGuardHome
[94315.277482] UDP : pid = 5306, comm = dnsmasq
[94315.282901] UDP : pid = 5306, comm = dnsmasq
[94344.587849] UDP : pid = 14776, comm = curl
[94344.592676] UDP : pid = 14776, comm = curl
[94344.598373] UDP : pid = 5306, comm = dnsmasq
[94344.603797] UDP : pid = 5306, comm = dnsmasq
[94345.188632] UDP : pid = 14861, comm = ssr-check
```
https://github.com/pacepi/port_connection
