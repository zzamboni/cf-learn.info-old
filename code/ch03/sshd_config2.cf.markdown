---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/sshd_config2.cf.html
posttitle: Code > Chapter 3 > sshd_config2.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/sshd_config2.cf)

<div class="highlight"><pre><span class="kd">vars</span><span class="p">:</span>
  <span class="c"># SSHD configuration to set</span>
  <span class="p">&quot;</span><span class="nv">sshd[Protocol]</span><span class="p">&quot;</span>       <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;2&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">sshd[X11Forwarding]</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;yes&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">sshd[UseDNS]</span><span class="p">&quot;</span>         <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;no&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">sshd[AllowRoot]</span><span class="p">&quot;</span>      <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;no&quot;</span><span class="p">;</span>

<span class="kd">files</span><span class="p">:</span>
  <span class="s">&quot;/etc/ssh/sshd_config&quot;</span>
    <span class="kr">handle</span>    <span class="o">=&gt;</span> <span class="s">&quot;sshd_config&quot;</span><span class="p">,</span>
    <span class="kr">comment</span>   <span class="o">=&gt;</span> <span class="s">&quot;Set sshd configuration&quot;</span><span class="p">,</span>
    <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">set_config_values</span><span class="p">(</span><span class="s">&quot;sshd&quot;</span><span class="p">),</span>
    <span class="kr">classes</span>   <span class="o">=&gt;</span> <span class="nf">if_repaired</span><span class="p">(</span><span class="s">&quot;restart_sshd&quot;</span><span class="p">);</span>

<span class="kd">commands</span><span class="p">:</span>
  <span class="nc">restart_sshd</span><span class="p">::</span>
    <span class="s">&quot;/etc/init.d/sshd reload&quot;</span>
      <span class="kr">handle</span>  <span class="o">=&gt;</span> <span class="s">&quot;sshd_restart&quot;</span><span class="p">,</span>
      <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Restart sshd if the configuration file was modified&quot;</span><span class="p">;</span>
</pre></div>


{% include codeindex.markdown %}
