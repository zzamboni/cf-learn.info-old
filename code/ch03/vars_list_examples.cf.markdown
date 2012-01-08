---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/vars_list_examples.cf.html
posttitle: Code > Chapter 3 > vars_list_examples.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/vars_list_examples.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span> <span class="p">{</span>
  <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
    <span class="s">&quot;l1&quot;</span> <span class="kr">ilist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;1&quot;</span><span class="p">,</span> <span class="s">&quot;2&quot;</span><span class="p">,</span> <span class="s">&quot;3&quot;</span> <span class="p">};</span>
    <span class="s">&quot;l2&quot;</span> <span class="kr">rlist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;1.0&quot;</span><span class="p">,</span> <span class="s">&quot;2.0&quot;</span><span class="p">,</span> <span class="s">&quot;3.0&quot;</span> <span class="p">};</span>
    <span class="p">&quot;</span><span class="nv">l3</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;one&quot;</span><span class="p">,</span> <span class="s">&quot;two&quot;</span><span class="p">,</span> <span class="s">&quot;three&quot;</span><span class="p">,</span> <span class="nv">@(l1)</span><span class="p">,</span> <span class="nv">@(l2)</span> <span class="p">};</span>

  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;l3 = </span><span class="si">$(l3)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


{% include codeindex.markdown %}
