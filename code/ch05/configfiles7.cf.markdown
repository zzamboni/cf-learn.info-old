---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/configfiles7.cf.html
posttitle: Code > Chapter 5 > configfiles7.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/configfiles7.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
      <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;configfiles&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">configfiles</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>  
      <span class="c"># Files to edit</span>
      <span class="p">&quot;</span><span class="nv">files[sysctl]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/sysctl.conf&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">files[sshd]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/ssh/sshd_config&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">files[inittab]</span><span class="p">&quot;</span>    <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/inittab&quot;</span><span class="p">;</span>
      

      <span class="p">&quot;</span><span class="nv">file_id</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;files&quot;</span><span class="p">);</span>

  <span class="kd">methods</span><span class="p">:</span>
      <span class="s">&quot;backup&quot;</span>  <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">backup_files</span><span class="p">(</span><span class="s">&quot;configfiles.files&quot;</span><span class="p">);</span>
      <span class="s">&quot;</span><span class="si">$(file_id)</span><span class="s">&quot;</span>  <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="s">&quot;edit_</span><span class="si">$(file_id)</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="s">&quot;users&quot;</span>   <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">manage_users</span><span class="p">(</span><span class="s">&quot;configfiles.users&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">backup_files</span><span class="p">(</span><span class="nv">param</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;backup_files&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">edit_sysctl</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;edit_sysctlconf: </span><span class="si">$(configfiles.files[sysctl])</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">edit_sshd</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;edit_sshdconfig: </span><span class="si">$(configfiles.files[sshd])</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">edit_inittab</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;edit_inittab: </span><span class="si">$(configfiles.files[inittab])</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">manage_users</span><span class="p">(</span><span class="nv">param</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;manage_users&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
