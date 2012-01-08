---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/host_classes3.cf.html
posttitle: Code > Chapter 5 > host_classes3.cf
navsection: code
---

[(download this file)](/src/ch05/host_classes3.cf)
{% highlight cf3 %}
bundle agent config
{
  classes:
      ###Functional classes
      "websrv" 
        or => { classmatch("websrv.*"),
                "testsrv_domain_com" };
      "linux_dnssrv"
        and => { classmatch("dnssrv.*"),
                 "linux" };
      ###Geographical classes, using IP ranges
      "location1"    ### 10.1.0.0/16, 10.2.0.0/16, also websrv01-10
        or => { iprange("10.1.0.0/16"), iprange("10.2.0.0/16"),
                hostrange("websrv", "01-10") };
      "location2"    ### 10.10.0.0/16, also websrv11-20
        or => { iprange("10.10.0.0/16"),
                hostrange("websrv", "11-20") };
}
{% endhighlight %}

{% include codeindex.markdown %}
