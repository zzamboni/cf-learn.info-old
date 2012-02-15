---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/monitor_for_changes.cf.html
posttitle: Code > Chapter 4 > monitor_for_changes.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/monitor_for_changes.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;monitor_for_changes&quot;</span> <span class="p">};</span>
        <span class="kr">inputs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;cfengine_stdlib.cf&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">monitor_for_changes</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">files_dirs</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;/bin&quot;</span><span class="p">,</span> <span class="s">&quot;/etc/passwd&quot;</span><span class="p">,</span> <span class="s">&quot;/etc/motd&quot;</span> <span class="p">};</span>

  <span class="kd">files</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">$(files_dirs)</span><span class="p">&quot;</span>
        <span class="kt">changes</span> <span class="o">=&gt;</span> <span class="nf">detect_all_change</span><span class="p">,</span>
        <span class="kr">depth_search</span> <span class="o">=&gt;</span> <span class="nf">recurse</span><span class="p">(</span><span class="s">&quot;inf&quot;</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
