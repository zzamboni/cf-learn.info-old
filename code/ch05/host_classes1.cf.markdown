---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/host_classes1.cf.html
posttitle: Code > Chapter 5 > host_classes1.cf
navsection: code
---

[(download this file)](/src/ch05/host_classes1.cf)
{% highlight cf3 %}
bundle agent config
{
  classes:
      "websrv"    or => { "websrv1_domain_com",
                          "websrv2_domain_com",
                          "websrv3_domain_com"
                        };
      "dnssrv"    or => { "dnssrv1_domain_com",
                          "dnssrv2_domain_com"
                        };
      
  methods:
    websrv::
      "config_websrv"   usebundle => config_websrv;
    dnssrv::
      "config_dnssrv"   usebundle => conig_dnssrv;
}
{% endhighlight %}

{% include codeindex.markdown %}
