(grep -iq AllowRoot /etc/ssh/sshd_config ||
 echo "AllowRoot no" >> /etc/ssh/sshd_config) &&
 sed -i 's/^.*AllowRoot .*$/AllowRoot no/;' /etc/ssh/sshd_config
