---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/sshd_config1.cf.html
posttitle: Code > Chapter 3 > sshd_config1.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/sshd_config1.cf)

<div class="highlight"><pre>  <span class="kd">files</span><span class="p">:</span>
<span class="p">&quot;</span><span class="nv">/etc/ssh/sshd_config</span><span class="p">&quot;</span>
<span class="kt">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Ensure root login is disallowed&quot;</span><span class="p">,</span>
<span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">append_if_no_line</span><span class="p">(</span><span class="s">&quot;AllowRoot no&quot;</span><span class="p">);</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
