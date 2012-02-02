---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/hierarchical_copy1.cf.html
posttitle: Code > Chapter 5 > hierarchical_copy1.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/hierarchical_copy1.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
   <span class="kr">inputs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;cfengine_stdlib.cf&quot;</span> <span class="p">};</span>
   <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
<span class="p">}</span>
 
<span class="c"># Use single copy for all files</span>
<span class="k">body</span> <span class="k">agent</span> <span class="k">control</span>
<span class="p">{</span>
   <span class="kr">files_single_copy</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;.*&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">suffixes</span><span class="p">&quot;</span>   <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;.</span><span class="si">$(sys.fqhost)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;.</span><span class="si">$(sys.uqhost)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;.</span><span class="si">$(sys.domain)</span><span class="s">&quot;</span><span class="p">,</span>
                          <span class="s">&quot;.</span><span class="si">$(sys.flavor)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;.</span><span class="si">$(sys.ostype)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;&quot;</span> <span class="p">};</span>
<span class="kd">files</span><span class="p">:</span>
  <span class="s">&quot;/etc/hosts&quot;</span>
    <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">local_dcp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(repository)</span><span class="s">/etc/hosts</span><span class="si">$(suffixes)</span><span class="s">&quot;</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
