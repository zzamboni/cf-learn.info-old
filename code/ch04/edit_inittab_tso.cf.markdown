---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/edit_inittab_tso.cf.html
posttitle: Code > Chapter 4 > edit_inittab_tso.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/edit_inittab_tso.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">disable_tso_flag</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">ipregex</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;192</span><span class="se">\.</span><span class="s">168</span><span class="se">\.</span><span class="s">.*&quot;</span><span class="p">;</span> 
      <span class="p">&quot;</span><span class="nv">nics</span><span class="p">&quot;</span>    <span class="kt">slist</span>  <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;sys.ipv4&quot;</span><span class="p">);</span>

  <span class="kd">classes</span><span class="p">:</span>
      <span class="s">&quot;isgreen_</span><span class="si">$(nics)</span><span class="s">&quot;</span> <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">regcmp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(ipregex)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(sys.ipv4[$(nics)])</span><span class="s">&quot;</span><span class="p">);</span> 

  <span class="kd">files</span><span class="p">:</span> 
      <span class="s">&quot;</span><span class="si">$(configfiles.files[inittab])</span><span class="s">&quot;</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;inittab_add_ethtool&quot;</span><span class="p">,</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Ensure ethtool is run on startup to disable the TSO flag&quot;</span><span class="p">,</span>
        <span class="kr">create</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">,</span>
        <span class="kr">edit_defaults</span> <span class="o">=&gt;</span> <span class="nf">edit_backup</span><span class="p">,</span>
        <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">replace_or_add</span><span class="p">(</span><span class="s">&quot;tso:3:.*&quot;</span><span class="p">,</span> 
                                    <span class="s">&quot;tso:3:once:/usr/sbin/ethtool -K </span><span class="si">$(nics)</span><span class="s"> tso off&quot;</span><span class="p">),</span>
        <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;isgreen_</span><span class="si">$(nics)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
