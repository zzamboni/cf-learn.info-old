---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/unit_method_polymorph.cf.html
posttitle: Code > Chapter 5 > unit_method_polymorph.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/unit_method_polymorph.cf)

<div class="highlight"><pre><span class="c">#</span>
<span class="c"># Demonstrates the use of polymorphism to call bundles.</span>
<span class="c">#</span>

<span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">###########################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">methods</span><span class="p">:</span>

      <span class="s">&quot;Patch Group&quot;</span> 

        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Apply OS specific patches and modifications&quot;</span><span class="p">,</span>
        <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(sys.class)</span><span class="s">_fix&quot;</span><span class="p">;</span>
      
<span class="p">}</span>

<span class="c">###########################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">linux_fix</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine_3</span><span class="p">::</span>
      <span class="s">&quot;Fixes for linux&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">###########################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">darwin_fix</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine_3</span><span class="p">::</span>
      <span class="s">&quot;Fixes for Mac OS X&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">###########################################</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
