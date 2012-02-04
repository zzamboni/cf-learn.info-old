---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/looping3.cf.html
posttitle: Code > Chapter 3 > looping3.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/looping3.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
      <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;find_netif&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">find_netif</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">nics</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;sys.ipv4&quot;</span><span class="p">);</span> 
      <span class="c"># Regex we want to match on the IP address</span>
      <span class="p">&quot;</span><span class="nv">ipregex</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;192</span><span class="se">\.</span><span class="s">168</span><span class="se">\.</span><span class="s">1</span><span class="se">\.</span><span class="s">.*&quot;</span><span class="p">;</span>

  <span class="kd">classes</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">ismatch_$(nics)</span><span class="p">&quot;</span> <span class="kt">expression</span> <span class="o">=&gt;</span> <span class="nf">regcmp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(ipregex)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">${sys.ipv4[$(nics)]}</span><span class="s">&quot;</span><span class="p">);</span> 

  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;NICs found: </span><span class="si">$(nics)</span><span class="s"> (</span><span class="si">$(sys.ipv4[$(nics)])</span><span class="s">)&quot;</span><span class="p">;</span> 

      <span class="p">&quot;</span><span class="nv">Matched NIC: $(nics) ($(sys.ipv4[$(nics)]))</span><span class="p">&quot;</span>
      <span class="kt">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;ismatch_</span><span class="si">$(nics)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
