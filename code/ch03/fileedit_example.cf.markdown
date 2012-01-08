---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/fileedit_example.cf.html
posttitle: Code > Chapter 3 > fileedit_example.cf
navsection: code
---

[(download this file)](/src/ch03/fileedit_example.cf)
{% highlight cf3 %}
bundle agent editexample
{
files:
  "/etc/motd"
    create => "true",
    edit_line => insert_lines("Unauthorized use will be prosecuted"),
    edit_defaults => backup_timestamp;
}

body edit_defaults backup_timestamp
{
  empty_file_before_editing => "false";
  edit_backup => "timestamp";
  max_file_size => "300000";
}


{% endhighlight %}

{% include codeindex.markdown %}
