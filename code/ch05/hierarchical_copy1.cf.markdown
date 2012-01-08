---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/hierarchical_copy1.cf.html
posttitle: Code > Chapter 5 > hierarchical_copy1.cf
navsection: code
---

[(download this file)](/src/ch05/hierarchical_copy1.cf)
{% highlight cf3 %}
body common control
{
   inputs => { "cfengine_stdlib.cf" };
   bundlesequence => { "test" };
}
 
# Use single copy for all files
body agent control
{
   files_single_copy => { ".*" };
}

bundle agent test
{
vars:
  "suffixes"   slist => { ".$(sys.fqhost)", ".$(sys.uqhost)", ".$(sys.domain)",
                          ".$(sys.flavour)", ".$(sys.ostype)", "" };
files:
  "/etc/hosts"
    copy_from => local_dcp("$(repository)/etc/hosts$(suffixes)");
}

{% endhighlight %}

{% include codeindex.markdown %}
