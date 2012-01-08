---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/update_inputs.cf.html
posttitle: Code > Chapter 3 > update_inputs.cf
navsection: code
---

[(download this file)](/src/ch03/update_inputs.cf)
{% highlight cf3 %}
bundle agent update_inputs
{
vars:
  "server"  string => "10.1.1.1";
  "inputs" string => "/var/cfengine/masterfiles/inputs";
files:
  "${sys.workdir}/inputs"
    copy_from => remote_cp("$(server)", "$(inputs)"),
    depth_search => recurse_ignore("inf", { "_.*" });
}

{% endhighlight %}

{% include codeindex.markdown %}
