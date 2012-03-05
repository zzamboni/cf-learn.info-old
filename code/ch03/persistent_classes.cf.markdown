---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/persistent_classes.cf.html
posttitle: Code > Chapter 3 > persistent_classes.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/persistent_classes.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">classes</span><span class="p">:</span>
    <span class="nc">!cache_is_active</span><span class="p">::</span>
      <span class="s">&quot;line_exists&quot;</span>     <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">regline</span><span class="p">(</span><span class="s">&quot;.*foo.*&quot;</span><span class="p">,</span> <span class="s">&quot;/tmp/test_data.txt&quot;</span><span class="p">),</span>
        <span class="kr">persistence</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>
      <span class="s">&quot;cache_is_active&quot;</span> <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="s">&quot;any&quot;</span><span class="p">,</span>
        <span class="kr">persistence</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">line_exists</span><span class="p">::</span>
      <span class="s">&quot;Line exists in file&quot;</span><span class="p">;</span>
    <span class="nc">!line_exists</span><span class="p">::</span>
      <span class="s">&quot;Line does not exist in file&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
