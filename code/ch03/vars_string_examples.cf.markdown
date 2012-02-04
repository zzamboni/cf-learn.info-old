---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/vars_string_examples.cf.html
posttitle: Code > Chapter 3 > vars_string_examples.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/vars_string_examples.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
      <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">s1</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;one&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">s2</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;this</span>
<span class="s">is a</span>
<span class="s">multine string&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">s3</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;with </span><span class="se">\&quot;</span><span class="s">quotes</span><span class="se">\&quot;</span><span class="s">&quot;</span><span class="p">;</span>

  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;s1 = </span><span class="si">$(s1)</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="s">&quot;s2 = </span><span class="si">$(s2)</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="s">&quot;s3 = </span><span class="si">$(s3)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
