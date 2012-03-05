---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/edit_line_example.cf.html
posttitle: Code > Chapter 3 > edit_line_example.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/edit_line_example.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test_edit_line</span>
<span class="p">{</span>
  <span class="kd">files</span><span class="p">:</span>
      <span class="c"># Set the 7th field (shell) of user &quot;nobody&quot; to &quot;/bin/false&quot;</span>
      <span class="s">&quot;/etc/passwd&quot;</span>
        <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">set_user_field</span><span class="p">(</span><span class="s">&quot;nobody&quot;</span><span class="p">,</span> <span class="s">&quot;7&quot;</span><span class="p">,</span> <span class="s">&quot;/bin/false&quot;</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
