---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/configfiles2.cf.html
posttitle: Code > Chapter 5 > configfiles2.cf
navsection: code
---

[(download this file)](/src/ch05/configfiles2.cf)
{% highlight cf3 %}
bundle agent configfiles
{
vars:  
  # Files to edit
  "files[sysctl]" string => "/etc/sysctl.conf";
  "files[sshd]"   string => "/etc/ssh/sshd_config";

  # Sysctl variables to set
  "sysctl[net.ipv4.tcp_syncookies]"               string => "1";
  "sysctl[net.ipv4.conf.all.accept_source_route]" string => "0";
  "sysctl[net.ipv4.conf.all.accept_redirects]"    string => "0";
  "sysctl[net.ipv4.conf.all.rp_filter]"           string => "1";
  "sysctl[net.ipv4.conf.all.log_martians]"        string => "1";

  # SSHD configuration to set
  "sshd[Protocol]"                                string => "2";
  "sshd[X11Forwarding]"                           string => "yes";
  "sshd[UseDNS]"				  string => "no";

methods:
  "sysctl"  usebundle => edit_sysctl;
  "sshd"    usebundle => edit_sshd;
}

bundle agent edit_sshd
{
files:
  "$(configfiles.files[sshdconfig])"
    handle => "edit_sshd",
    comment => "Set desired sshd_config parameters",
    edit_line => set_config_values("configfiles.sshd"),
    classes => if_repaired("restart_sshd");

commands:
  restart_sshd.!no_restarts::
    "/etc/init.d/sshd reload"
      handle => "sshd_restart",
      comment => "Restart sshd if the configuration file was modified";
}


{% endhighlight %}

{% include codeindex.markdown %}
