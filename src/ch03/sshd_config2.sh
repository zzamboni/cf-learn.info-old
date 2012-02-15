(grep -iq 'PermitRootLogin' /etc/ssh/sshd_config ||
 echo "PermitRootLogin no" >> /etc/ssh/sshd_config) &&
 sed -i 's/^.*PermitRootLogin.*$/PermitRootLogin no/;' /etc/ssh/sshd_config
