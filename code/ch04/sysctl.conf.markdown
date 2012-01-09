---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/sysctl.conf.html
posttitle: Code > Chapter 4 > sysctl.conf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/sysctl.conf)

<div class="highlight"><pre><span class="na">net.ipv4.tcp_syncookies</span> <span class="o">=</span> <span class="s">1</span>
<span class="na">net.ipv4.conf.all.accept_source_route</span> <span class="o">=</span> <span class="s">0</span>
<span class="na">net.ipv4.conf.all.accept_redirects</span> <span class="o">=</span> <span class="s">0</span>
<span class="na">net.ipv4.conf.all.rp_filter</span> <span class="o">=</span> <span class="s">1</span>
<span class="na">net.ipv4.conf.all.log_martians</span> <span class="o">=</span> <span class="s">1</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
