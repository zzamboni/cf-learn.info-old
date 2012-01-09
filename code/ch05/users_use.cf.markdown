---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/users_use.cf.html
posttitle: Code > Chapter 5 > users_use.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/users_use.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">manage_users</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="c">### Users to create</span>
  <span class="p">&quot;</span><span class="nv">users[root][fullname]</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;System administrator&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">users[root][uid]</span><span class="p">&quot;</span>       <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;0&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">users[root][gid]</span><span class="p">&quot;</span>       <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;0&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">users[root][home]</span><span class="p">&quot;</span>      <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/root&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">users[root][shell]</span><span class="p">&quot;</span>     <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/bash&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">users[root][flags]</span><span class="p">&quot;</span>     <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;-o -m&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">users[root][password]</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;FkDMzhB1WnOp2&quot;</span><span class="p">;</span>

  <span class="p">&quot;</span><span class="nv">users[zamboni][fullname]</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;Diego Zamboni&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">users[zamboni][uid]</span><span class="p">&quot;</span>       <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;501&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">users[zamboni][gid]</span><span class="p">&quot;</span>       <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;users&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">users[zamboni][home]</span><span class="p">&quot;</span>      <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/home/zamboni&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">users[zamboni][shell]</span><span class="p">&quot;</span>     <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/bash&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">users[zamboni][flags]</span><span class="p">&quot;</span>     <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;-m&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">users[zamboni][password]</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;dk52ia209rfuh&quot;</span><span class="p">;</span>

<span class="kd">methods</span><span class="p">:</span>
  <span class="s">&quot;users&quot;</span>   <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">create_users</span><span class="p">(</span><span class="s">&quot;manage_users.users&quot;</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
