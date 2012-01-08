---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/sshd_config2.cf.html
posttitle: Code > Chapter 3 > sshd_config2.cf
navsection: code
---

[(download this file)](/src/ch03/sshd_config2.cf)
{% highlight cf3 %}
vars:
  # SSHD configuration to set
  "sshd[Protocol]"       string => "2";
  "sshd[X11Forwarding]"  string => "yes";
  "sshd[UseDNS]"         string => "no";
  "sshd[AllowRoot]"      string => "no";

files:
  "/etc/ssh/sshd_config"
    handle    => "sshd_config",
    comment   => "Set sshd configuration",
    edit_line => set_config_values("sshd"),
    classes   => if_repaired("restart_sshd");

commands:
  restart_sshd::
    "/etc/init.d/sshd reload"
      handle  => "sshd_restart",
      comment => "Restart sshd if the configuration file was modified";

{% endhighlight %}

{% include codeindex.markdown %}
