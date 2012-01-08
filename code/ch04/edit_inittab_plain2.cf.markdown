---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/edit_inittab_plain2.cf.html
posttitle: Code > Chapter 4 > edit_inittab_plain2.cf
navsection: code
---

[(download this file)](/src/ch04/edit_inittab_plain2.cf)
{% highlight cf3 %}
files:
  "/etc/inittab"
    handle => "inittab_disable_ctrlaltdel",
    comment => "Ensure handling of ctrl-alt-del is disabled",
    create    => "false",
    edit_defaults => backup_timestamp,
    edit_line => comment_lines_matching("ca::ctrlaltdel:.*", "#");
}

{% endhighlight %}

{% include codeindex.markdown %}
