---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/wordpress_test.cf.html
posttitle: Code > Chapter 4 > wordpress_test.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/wordpress_test.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
  <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="nf">wp_install</span><span class="p">(</span><span class="s">&quot;g.wp_config&quot;</span><span class="p">)</span> <span class="p">};</span>
  <span class="kr">inputs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;cfengine_stdlib.cf&quot;</span><span class="p">,</span> <span class="s">&quot;wordpress.cf&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">common</span> <span class="nf">g</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">wp_config[DB_NAME]</span><span class="p">&quot;</span>      <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;wordpress&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">wp_config[DB_USER]</span><span class="p">&quot;</span>      <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;wordpress&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">wp_config[DB_PASSWORD]</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;lopsa10linux&quot;</span><span class="p">;</span>
  <span class="nc">debian</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">wp_config[_htmlroot]</span><span class="p">&quot;</span>     <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/var/www&quot;</span><span class="p">;</span>
  <span class="nc">redhat</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">wp_config[_htmlroot]</span><span class="p">&quot;</span>     <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/var/www/html&quot;</span><span class="p">;</span>
  <span class="nc">any</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">wp_config[_wp_dir]</span><span class="p">&quot;</span>       <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(wp_config[_htmlroot])</span><span class="s">/blog&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


----

{% include codeindex.markdown %}
