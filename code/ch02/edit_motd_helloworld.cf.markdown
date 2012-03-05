---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch02/edit_motd_helloworld.cf.html
posttitle: Code > Chapter 2 > edit_motd_helloworld.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch02/edit_motd_helloworld.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;edit_motd&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">edit_motd</span> 
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>   
      <span class="p">&quot;</span><span class="nv">motd</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc/motd&quot;</span><span class="p">;</span>

  <span class="kd">files</span><span class="p">:</span>   
      <span class="s">&quot;</span><span class="si">$(motd)</span><span class="s">&quot;</span>
        <span class="kr">create</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">,</span>
        <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">addmessage</span><span class="p">;</span>

  <span class="kd">reports</span><span class="p">:</span>   
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;Hello world!&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">addmessage</span>
<span class="p">{</span>
  <span class="kd">insert_lines</span><span class="p">:</span>
      <span class="s">&quot;This system is managed by CFEngine 3&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
