---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/edit_inittab_plain2.cf.html
posttitle: Code > Chapter 4 > edit_inittab_plain2.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/edit_inittab_plain2.cf)

<div class="highlight"><pre>  <span class="kd">files</span><span class="p">:</span>
<span class="p">&quot;</span><span class="nv">/etc/inittab</span><span class="p">&quot;</span>
<span class="kt">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;inittab_disable_ctrlaltdel&quot;</span><span class="p">,</span>
<span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Ensure handling of ctrl-alt-del is disabled&quot;</span><span class="p">,</span>
<span class="kr">create</span>    <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">,</span>
<span class="kr">edit_defaults</span> <span class="o">=&gt;</span> <span class="nf">backup_timestamp</span><span class="p">,</span>
<span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">comment_lines_matching</span><span class="p">(</span><span class="s">&quot;ca::ctrlaltdel:.*&quot;</span><span class="p">,</span> <span class="s">&quot;#&quot;</span><span class="p">);</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
