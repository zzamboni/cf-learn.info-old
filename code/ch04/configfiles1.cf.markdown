---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/configfiles1.cf.html
posttitle: Code > Chapter 4 > configfiles1.cf
navsection: code
---

[(download this file)](/src/ch04/configfiles1.cf)
{% highlight cf3 %}
bundle agent configfiles 
{
vars:  
  # Files to edit
  "files[sysctl]" string => "/etc/sysctl.conf"; 

  # Sysctl variables to set
  "sysctl[net.ipv4.tcp_syncookies]"               string => "1"; 
  "sysctl[net.ipv4.conf.all.accept_source_route]" string => "0";
  "sysctl[net.ipv4.conf.all.accept_redirects]"    string => "0";
  "sysctl[net.ipv4.conf.all.rp_filter]"           string => "1";
  "sysctl[net.ipv4.conf.all.log_martians]"        string => "1";

methods: 
  "sysctl"  usebundle => edit_sysctl;
}

bundle agent edit_sysctl
{
files: 
  "$(configfiles.files[sysctl])"
    handle => "edit_sysctl",
    comment => "Make sure sysctl.conf contains desired configuration settings",
    create => "true",
    edit_line => set_variable_values("configfiles.sysctl"), 
    classes => if_repaired("sysctl_modified"); 
 
commands: 
  sysctl_modified.!no_restarts::
    "/sbin/sysctl -p"
    handle => "reload_sysctl",
    comment => "Make sure new sysctl settings are loaded";
}


{% endhighlight %}

{% include codeindex.markdown %}
