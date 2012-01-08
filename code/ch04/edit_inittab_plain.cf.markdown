---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/edit_inittab_plain.cf.html
posttitle: Code > Chapter 4 > edit_inittab_plain.cf
navsection: code
---

[(download this file)](/src/ch04/edit_inittab_plain.cf)
{% highlight cf3 %}
files: 
  "/etc/inittab"
    handle => "inittab_set_initdefault",
    comment => "Ensure graphical mode is disabled (default runmode=3)",
    create    => "false",
    edit_defaults => backup_timestamp, 
    edit_line => set_colon_field("id","2","3"); 

{% endhighlight %}

{% include codeindex.markdown %}
