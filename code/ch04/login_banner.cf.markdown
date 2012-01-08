---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/login_banner.cf.html
posttitle: Code > Chapter 4 > login_banner.cf
navsection: code
---

[(download this file)](/src/ch04/login_banner.cf)
{% highlight cf3 %}
body common control 
{
  bundlesequence => { "login_banner" };
  inputs => { "cfengine_stdlib.cf" }; 
}

bundle agent login_banner
{
  vars:
    "template_file" string => "/var/cfengine/templates/motd_template.txt";   
    "motd_file"     string => "/tmp/motd"; 
		
  files:
  "$(motd_file)"   
    handle => "set_login_banner",
    comment => "Ensure the login banner is set to the authorized text",
    create => "true",
    perms => m("744"),
    edit_defaults => empty,
    edit_line => expand_template("$(template_file)"); 
}

{% endhighlight %}

{% include codeindex.markdown %}
