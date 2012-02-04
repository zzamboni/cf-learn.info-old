---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/configfiles5.cf.html
posttitle: Code > Chapter 5 > configfiles5.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/configfiles5.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">configfiles</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>  
      <span class="c"># Files to edit</span>
      <span class="p">&quot;</span><span class="nv">files[sysctlconf]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/sysctl.conf&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">files[sshdconfig]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/ssh/sshd_config&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">files[inittab]</span><span class="p">&quot;</span>    <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/inittab&quot;</span><span class="p">;</span>
      

  <span class="kd">methods</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">backup</span><span class="p">&quot;</span>  <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">backup_files</span><span class="p">(</span><span class="s">&quot;configfiles.files&quot;</span><span class="p">);</span>
      <span class="p">&quot;</span><span class="nv">sysctl</span><span class="p">&quot;</span>  <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">edit_sysctl</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">sshd</span><span class="p">&quot;</span>    <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">edit_sshd</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">inittab</span><span class="p">&quot;</span> <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">edit_inittab</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">users</span><span class="p">&quot;</span>   <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">manage_users</span><span class="p">(</span><span class="s">&quot;configfiles.users&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">backup_files</span><span class="p">(</span><span class="nv">id</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">allfiles</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(id)</span><span class="s">&quot;</span><span class="p">);</span>

  <span class="kd">files</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">$(allfiles).original</span><span class="p">&quot;</span>
      <span class="kt">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Ensure we have a backup of previous versions of </span><span class="si">$(allfiles)</span><span class="s">&quot;</span><span class="p">,</span>
      <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">backup_local_cp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(allfiles)</span><span class="s">&quot;</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
