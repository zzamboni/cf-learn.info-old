---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/selective_copy1.cf.html
posttitle: Code > Chapter 5 > selective_copy1.cf
navsection: code
---

[(download this file)](/src/ch05/selective_copy1.cf)
{% highlight cf3 %}
body common control
{
      inputs => { "cfengine_stdlib.cf" };
      bundlesequence => { "test" };
}

body agent control
{
      # Single copy for all files
      files_single_copy => { ".*" }; 
}

bundle agent test
{
  files: 
    wonderwoman_justiceleague_com::
      "/etc/hosts"
        copy_from => local_cp("$(repository)/etc/hosts.wonderwoman.justiceleague.com");
    lex::
      "/etc/hosts"
        copy_from => local_cp("$(repository)/etc/hosts.lex");
    justiceleague_com::
      "/etc/hosts"
        copy_from => local_cp("$(repository)/etc/hosts.justiceleague.com");
    ssosv_com::
      "/etc/hosts"
        copy_from => local_cp("$(repository)/etc/hosts.ssosv.com");
    suse_9::
      "/etc/hosts"
        copy_from => local_cp("$(repository)/etc/hosts.suse_9");
    windows::
      "/etc/hosts"
        copy_from => local_cp("$(repository)/etc/hosts.windows");
    any::
      "/etc/hosts"
        copy_from => local_cp("$(repository)/etc/hosts");
}

{% endhighlight %}

{% include codeindex.markdown %}
