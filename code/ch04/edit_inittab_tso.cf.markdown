---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/edit_inittab_tso.cf.html
posttitle: Code > Chapter 4 > edit_inittab_tso.cf
navsection: code
---

[(download this file)](/src/ch04/edit_inittab_tso.cf)
{% highlight cf3 %}
bundle agent disable_tso_flag
{
vars:
  "ipregex" string => "192\.168\..*"; 
  "nics"    slist  => getindices("sys.ipv4");

classes:
  "isgreen_$(nics)" expression => regcmp("$(ipregex)", "$(sys.ipv4[$(nics)])"); 

files: 
  "$(configfiles.files[inittab])"
    handle => "inittab_add_ethtool",
    comment => "Ensure ethtool is run on startup to disable the TSO flag",
    create    => "false",
    edit_defaults => edit_backup,
    edit_line => replace_or_add("tso:3:.*", 
				"tso:3:once:/usr/sbin/ethtool -K $(nics) tso off"),
    ifvarclass => "isgreen_$(nics)";
}

{% endhighlight %}

{% include codeindex.markdown %}
