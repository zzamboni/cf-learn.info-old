---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/abortclasses.cf.html
posttitle: Code > Chapter 5 > abortclasses.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/abortclasses.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">agent</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">abortclasses</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;disable_cfengine&quot;</span> <span class="p">};</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
