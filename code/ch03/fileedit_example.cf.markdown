---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/fileedit_example.cf.html
posttitle: Code > Chapter 3 > fileedit_example.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/fileedit_example.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">editexample</span>
<span class="p">{</span>
  <span class="kd">files</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">/etc/motd</span><span class="p">&quot;</span>
      <span class="kt">create</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">,</span>
      <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">insert_lines</span><span class="p">(</span><span class="s">&quot;Unauthorized use will be prosecuted&quot;</span><span class="p">),</span>
      <span class="kr">edit_defaults</span> <span class="o">=&gt;</span> <span class="nf">backup_timestamp</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">body</span> <span class="k">edit_defaults</span> <span class="nf">backup_timestamp</span>
<span class="p">{</span>
      <span class="kr">empty_file_before_editing</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
      <span class="kr">edit_backup</span> <span class="o">=&gt;</span> <span class="s">&quot;timestamp&quot;</span><span class="p">;</span>
      <span class="kr">max_file_size</span> <span class="o">=&gt;</span> <span class="s">&quot;300000&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
