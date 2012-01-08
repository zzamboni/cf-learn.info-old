---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/looping3.cf.html
posttitle: Code > Chapter 3 > looping3.cf
navsection: code
---

[(download this file)](/src/ch03/looping3.cf)
{% highlight cf3 %}
body common control
{
  bundlesequence => { "find_netif" };
}

bundle agent find_netif
{
vars:
  "nics" slist => getindices("sys.ipv4"); 
  # Regex we want to match on the IP address
  "ipregex" string => "192\.168\.1\..*";

classes:
  "ismatch_$(nics)" expression => regcmp("$(ipregex)", "${sys.ipv4[$(nics)]}"); 

reports:
  cfengine::
    "NICs found: $(nics) ($(sys.ipv4[$(nics)]))"; 

    "Matched NIC: $(nics) ($(sys.ipv4[$(nics)]))"
      ifvarclass => "ismatch_$(nics)";
}

{% endhighlight %}

{% include codeindex.markdown %}
