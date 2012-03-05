---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/configfiles3.cf.html
posttitle: Code > Chapter 4 > configfiles3.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/configfiles3.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">configfiles</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>  
      <span class="c"># Files to edit</span>
      <span class="p">&quot;</span><span class="nv">files[sysctlconf]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/sysctl.conf&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">files[sshdconfig]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/ssh/sshd_config&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">files[inittab]</span><span class="p">&quot;</span>    <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/inittab&quot;</span><span class="p">;</span>

      <span class="c"># Sysctl variables to set</span>
      <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.tcp_syncookies]</span><span class="p">&quot;</span>               <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.conf.all.accept_source_route]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;0 &quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.conf.all.accept_redirects]</span><span class="p">&quot;</span>    <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;0&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.conf.all.rp_filter]</span><span class="p">&quot;</span>           <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">sysctl[net.ipv4.conf.all.log_martians]</span><span class="p">&quot;</span>        <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>

      <span class="c"># SSHD configuration to set</span>
      <span class="p">&quot;</span><span class="nv">sshd[Protocol]</span><span class="p">&quot;</span>                                <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;2&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">sshd[X11Forwarding]</span><span class="p">&quot;</span>                           <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;yes&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">sshd[UseDNS]</span><span class="p">&quot;</span>                                  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;no&quot;</span><span class="p">;</span>

  <span class="kd">methods</span><span class="p">:</span>
      <span class="s">&quot;sysctl&quot;</span>  <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">edit_sysctl</span><span class="p">;</span>
      <span class="s">&quot;sshd&quot;</span>    <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">edit_sshd</span><span class="p">;</span>
      <span class="s">&quot;inittab&quot;</span> <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">edit_inittab</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">edit_inittab</span>
<span class="p">{</span>
  <span class="kd">files</span><span class="p">:</span>
      <span class="s">&quot;</span><span class="si">$(configfiles.files[inittab])</span><span class="s">&quot;</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;inittab_set_initdefault&quot;</span><span class="p">,</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Ensure graphical mode is disabled (default runmode=3)&quot;</span><span class="p">,</span>
        <span class="kr">create</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">,</span>
        <span class="kr">edit_defaults</span> <span class="o">=&gt;</span> <span class="nf">backup_timestamp</span><span class="p">,</span>
        <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">set_colon_field</span><span class="p">(</span><span class="s">&quot;id&quot;</span><span class="p">,</span><span class="s">&quot;2&quot;</span><span class="p">,</span><span class="s">&quot;3&quot;</span><span class="p">);</span>

      <span class="s">&quot;</span><span class="si">$(configfiles.files[inittab])</span><span class="s">&quot;</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;inittab_disable_ctrlaltdel&quot;</span><span class="p">,</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Ensure handling of ctrl-alt-del is disabled&quot;</span><span class="p">,</span>
        <span class="kr">create</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">,</span>
        <span class="kr">edit_defaults</span> <span class="o">=&gt;</span> <span class="nf">backup_timestamp</span><span class="p">,</span>
        <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">comment_lines_matching</span><span class="p">(</span><span class="s">&quot;ca::ctrlaltdel:.*&quot;</span><span class="p">,</span> <span class="s">&quot;#&quot;</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
