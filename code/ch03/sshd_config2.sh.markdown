---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/sshd_config2.sh.html
posttitle: Code > Chapter 3 > sshd_config2.sh
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/sshd_config2.sh)

<div class="highlight"><pre><span class="o">(</span>grep -iq AllowRoot /etc/ssh/sshd_config <span class="o">||</span>
 <span class="nb">echo</span> <span class="s2">&quot;AllowRoot no&quot;</span> &gt;&gt; /etc/ssh/sshd_config<span class="o">)</span> <span class="o">&amp;&amp;</span>
 sed -i <span class="s1">&#39;s/^.*AllowRoot .*$/AllowRoot no/;&#39;</span> /etc/ssh/sshd_config
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
