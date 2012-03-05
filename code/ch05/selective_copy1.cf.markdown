---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/selective_copy1.cf.html
posttitle: Code > Chapter 5 > selective_copy1.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/selective_copy1.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">inputs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;cfengine_stdlib.cf&quot;</span> <span class="p">};</span>
        <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">body</span> <span class="k">agent</span> <span class="k">control</span>
<span class="p">{</span>
      <span class="c"># Single copy for all files</span>
        <span class="kr">files_single_copy</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;.*&quot;</span> <span class="p">};</span> 
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">files</span><span class="p">:</span> 
    <span class="nc">wonderwoman_justiceleague_com</span><span class="p">::</span>
      <span class="s">&quot;/etc/hosts&quot;</span>
        <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">local_cp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(repository)</span><span class="s">/etc/hosts.wonderwoman.justiceleague.com&quot;</span><span class="p">);</span>
    <span class="nc">lex</span><span class="p">::</span>
      <span class="s">&quot;/etc/hosts&quot;</span>
        <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">local_cp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(repository)</span><span class="s">/etc/hosts.lex&quot;</span><span class="p">);</span>
    <span class="nc">justiceleague_com</span><span class="p">::</span>
      <span class="s">&quot;/etc/hosts&quot;</span>
        <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">local_cp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(repository)</span><span class="s">/etc/hosts.justiceleague.com&quot;</span><span class="p">);</span>
    <span class="nc">ssosv_com</span><span class="p">::</span>
      <span class="s">&quot;/etc/hosts&quot;</span>
        <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">local_cp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(repository)</span><span class="s">/etc/hosts.ssosv.com&quot;</span><span class="p">);</span>
    <span class="nc">suse_9</span><span class="p">::</span>
      <span class="s">&quot;/etc/hosts&quot;</span>
        <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">local_cp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(repository)</span><span class="s">/etc/hosts.suse_9&quot;</span><span class="p">);</span>
    <span class="nc">windows</span><span class="p">::</span>
      <span class="s">&quot;/etc/hosts&quot;</span>
        <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">local_cp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(repository)</span><span class="s">/etc/hosts.windows&quot;</span><span class="p">);</span>
    <span class="nc">any</span><span class="p">::</span>
      <span class="s">&quot;/etc/hosts&quot;</span>
        <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">local_cp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(repository)</span><span class="s">/etc/hosts&quot;</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
