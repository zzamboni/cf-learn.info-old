---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/configfiles2.cf.html
posttitle: Code > Chapter 5 > configfiles2.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/configfiles2.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">configfiles</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>  
  <span class="c"># Files to edit</span>
  <span class="p">&quot;</span><span class="nv">files[sysctl]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/sysctl.conf&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">files[sshd]</span><span class="p">&quot;</span>   <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/ssh/sshd_config&quot;</span><span class="p">;</span>

  <span class="c"># Sysctl variables to set</span>
  <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.tcp_syncookies]</span><span class="p">&quot;</span>               <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.conf.all.accept_source_route]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;0&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.conf.all.accept_redirects]</span><span class="p">&quot;</span>    <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;0&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.conf.all.rp_filter]</span><span class="p">&quot;</span>           <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.conf.all.log_martians]</span><span class="p">&quot;</span>        <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>

  <span class="c"># SSHD configuration to set</span>
  <span class="p">&quot;</span><span class="nv">sshd[Protocol]</span><span class="p">&quot;</span>                                <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;2&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">sshd[X11Forwarding]</span><span class="p">&quot;</span>                           <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;yes&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">sshd[UseDNS]</span><span class="p">&quot;</span>				  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;no&quot;</span><span class="p">;</span>

<span class="kd">methods</span><span class="p">:</span>
  <span class="s">&quot;sysctl&quot;</span>  <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">edit_sysctl</span><span class="p">;</span>
  <span class="s">&quot;sshd&quot;</span>    <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">edit_sshd</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">edit_sshd</span>
<span class="p">{</span>
<span class="kd">files</span><span class="p">:</span>
  <span class="s">&quot;</span><span class="si">$(configfiles.files[sshdconfig])</span><span class="s">&quot;</span>
    <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;edit_sshd&quot;</span><span class="p">,</span>
    <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Set desired sshd_config parameters&quot;</span><span class="p">,</span>
    <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">set_config_values</span><span class="p">(</span><span class="s">&quot;configfiles.sshd&quot;</span><span class="p">),</span>
    <span class="kr">classes</span> <span class="o">=&gt;</span> <span class="nf">if_repaired</span><span class="p">(</span><span class="s">&quot;restart_sshd&quot;</span><span class="p">);</span>

<span class="kd">commands</span><span class="p">:</span>
  <span class="nc">restart_sshd.!no_restarts</span><span class="p">::</span>
    <span class="s">&quot;/etc/init.d/sshd reload&quot;</span>
      <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;sshd_restart&quot;</span><span class="p">,</span>
      <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Restart sshd if the configuration file was modified&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
