---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/network_profiles.cf.html
posttitle: Code > Chapter 4 > network_profiles.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/network_profiles.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">network_profiles</span>
<span class="p">{</span>
  <span class="kd">commands</span><span class="p">:</span>
    <span class="nc">ipv4_192_168_23</span><span class="p">::</span>   <span class="c">### At home, 192.168.23.0/24, start my backup</span>
      <span class="s">&quot;/usr/local/sbin/open_services.sh&quot;</span><span class="p">;</span>
      <span class="s">&quot;/usr/local/sbin/run_backup.sh&quot;</span><span class="p">;</span>
      <span class="s">&quot;/usr/local/sbin/configure_home_printer.sh&quot;</span><span class="p">;</span>
    <span class="nc">ipv4_9_4</span><span class="p">::</span>         <span class="c">### At work, 9.4.0.0/16, configure the appropriate printers</span>
      <span class="s">&quot;/usr/local/sbin/open_services.sh&quot;</span><span class="p">;</span>
      <span class="s">&quot;/usr/local/sbin/configure_work_printers.sh&quot;</span><span class="p">;</span>
    <span class="nc">!ipv4_192_168_1.!ipv4_9_4</span><span class="p">::</span>   <span class="c">### Anywhere else, close some services for additional protection</span>
      <span class="s">&quot;/usr/local/sbin/close_services.sh&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
