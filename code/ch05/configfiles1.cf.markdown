---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/configfiles1.cf.html
posttitle: Code > Chapter 5 > configfiles1.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/configfiles1.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">configfiles</span> 
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>  
      <span class="c"># Files to edit</span>
      <span class="p">&quot;</span><span class="nv">files[sysctl]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/sysctl.conf&quot;</span><span class="p">;</span> 

      <span class="c"># Sysctl variables to set</span>
      <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.tcp_syncookies]</span><span class="p">&quot;</span>               <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span> 
      <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.conf.all.accept_source_route]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;0&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.conf.all.accept_redirects]</span><span class="p">&quot;</span>    <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;0&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.conf.all.rp_filter]</span><span class="p">&quot;</span>           <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.conf.all.log_martians]</span><span class="p">&quot;</span>        <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>

  <span class="kd">methods</span><span class="p">:</span> 
      <span class="p">&quot;</span><span class="nv">sysctl</span><span class="p">&quot;</span>  <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">edit_sysctl</span><span class="p">,</span>
      <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Configure </span><span class="si">$(files[sysctl])</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">edit_sysctl</span>
<span class="p">{</span>
  <span class="kd">files</span><span class="p">:</span> 
      <span class="p">&quot;</span><span class="nv">$(configfiles.files[sysctl])</span><span class="p">&quot;</span>
      <span class="kt">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;edit_sysctl&quot;</span><span class="p">,</span>
      <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Make sure sysctl.conf contains desired configuration settings&quot;</span><span class="p">,</span>
      <span class="kr">create</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">,</span>
      <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">set_variable_values</span><span class="p">(</span><span class="s">&quot;configfiles.sysctl&quot;</span><span class="p">),</span> 
      <span class="kr">classes</span> <span class="o">=&gt;</span> <span class="nf">if_repaired</span><span class="p">(</span><span class="s">&quot;sysctl_modified&quot;</span><span class="p">);</span> 
      
  <span class="kd">commands</span><span class="p">:</span> 
    <span class="nc">sysctl_modified.!no_restarts</span><span class="p">::</span>
      <span class="p">&quot;</span><span class="nv">/sbin/sysctl -p</span><span class="p">&quot;</span>
      <span class="kt">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;reload_sysctl&quot;</span><span class="p">,</span>
      <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Make sure new sysctl settings are loaded&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
