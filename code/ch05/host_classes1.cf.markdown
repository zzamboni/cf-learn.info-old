---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/host_classes1.cf.html
posttitle: Code > Chapter 5 > host_classes1.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/host_classes1.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">config</span>
<span class="p">{</span>
  <span class="kd">classes</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">websrv</span><span class="p">&quot;</span>    <span class="kt">or</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;websrv1_domain_com&quot;</span><span class="p">,</span>
                          <span class="s">&quot;websrv2_domain_com&quot;</span><span class="p">,</span>
                          <span class="s">&quot;websrv3_domain_com&quot;</span>
                        <span class="p">};</span>
      <span class="p">&quot;</span><span class="nv">dnssrv</span><span class="p">&quot;</span>    <span class="kt">or</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;dnssrv1_domain_com&quot;</span><span class="p">,</span>
                          <span class="s">&quot;dnssrv2_domain_com&quot;</span>
                        <span class="p">};</span>
      
  <span class="kd">methods</span><span class="p">:</span>
    <span class="nc">websrv</span><span class="p">::</span>
      <span class="p">&quot;</span><span class="nv">config_websrv</span><span class="p">&quot;</span>   <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">config_websrv</span><span class="p">;</span>
    <span class="nc">dnssrv</span><span class="p">::</span>
      <span class="p">&quot;</span><span class="nv">config_dnssrv</span><span class="p">&quot;</span>   <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">conig_dnssrv</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
