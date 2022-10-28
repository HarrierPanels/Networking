#!/bin/bash
#
# The script will add rules to iptables that will take effect immediately.
# The first rule can be modified as necessary using the $rule variable. 
# More rules can be added manually later via the script prompt. The rules 
# will be effective on boot! The version v1.0 is root user only!
#

# Global variables
script="/usr/sbin/rule.v4"
service="/usr/lib/systemd/system/iptd.service"
subnet="10.0.0.0/17"
src="192.168.0.200"
rule="sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE"

# Global functions
addrule() {
cat << EOF >> $script

$*
EOF
}

activate() {
systemctl daemon-reload
systemctl enable iptd.service
service iptd start
echo "Activated!"
}

deactivate() {
systemctl disable iptd.service
rm $script $service
systemctl daemon-reload
echo "Service removed! Restart system!"
}


next() {
while :; do 
read -r -p "Add another rule? [y/n] " input 

case $input in

y) read -r -p "Enter the rule: " nextrule 
addrule $nextrule && activate && next;;
n)
exit;;
*)
echo "Answer ( y ) for yes or ( n ) for no.";;
esac
done
}

# Main
if [ -f $script ] && [ -f $service ]; then
while :; do
read -r -p "Want to add another rule to iptables? [y/n/d/?] " input
echo -e "[y] - yes\n[n] - no\n[d] - delete iptd service"

case $input in
y) 
read -r -p "Enter the rule: " newrule
addrule $newrule && activate && next;;
n)
exit;;
d)
deactivate && exit;;
*)
echo "Answer [y/n/d] - yes, no, or delete.";;
esac
done
else

# Adding script
cat << EOF > $script
#!/bin/bash

$rule
EOF

chmod +x $script

# Adding service
cat << EOF > $service
[Unit]
Description=IPTables Rule Service v1.0

[Service]
ExecStart=/bin/bash $script

[Install]
WantedBy=multi-user.target
EOF

activate
fi
