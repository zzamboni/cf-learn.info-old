---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch02/edit_motd_helloworld.cf.html
posttitle: Code > Chapter 2 > edit_motd_helloworld.cf
navsection: code
---

[(download this file)](/src/ch02/edit_motd_helloworld.cf)
{% highlight cf3 %}
body common control
{
  bundlesequence => { "edit_motd" };
}

bundle agent edit_motd
{
vars:
  "motd" string => "/etc/motd";

files:
  "$(motd)"
    edit_line => addmessage,
    create => "true";

reports:
  cfengine::
    "Hello world!";
}

bundle edit_line addmessage
{
  insert_lines:
    "This system is managed by cfengine ${sys.cf_version}";
}

{% endhighlight %}

{% include codeindex.markdown %}
