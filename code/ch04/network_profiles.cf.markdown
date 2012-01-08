---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/network_profiles.cf.html
posttitle: Code > Chapter 4 > network_profiles.cf
navsection: code
---

[(download this file)](/src/ch04/network_profiles.cf)
{% highlight cf3 %}
bundle agent network_profiles
{
  commands:
    ipv4_192_168_23::   ### At home, 192.168.23.0/24, start my backup
      "/usr/local/sbin/open_services.sh";
      "/usr/local/sbin/run_backup.sh";
      "/usr/local/sbin/configure_home_printer.sh";
    ipv4_9_4::         ### At work, 9.4.0.0/16, configure the appropriate printers
      "/usr/local/sbin/open_services.sh";
      "/usr/local/sbin/configure_work_printers.sh";
    !ipv4_192_168_1.!ipv4_9_4::   ### Anywhere else, close some services for additional protection
      "/usr/local/sbin/close_services.sh";
}

{% endhighlight %}

{% include codeindex.markdown %}
