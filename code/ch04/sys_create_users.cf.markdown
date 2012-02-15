---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/sys_create_users.cf.html
posttitle: Code > Chapter 4 > sys_create_users.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/sys_create_users.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">create_users</span><span class="p">(</span><span class="nv">info</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">user</span><span class="p">&quot;</span>        <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(info)</span><span class="s">&quot;</span><span class="p">);</span> 

  <span class="kd">classes</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">add_$(user)</span><span class="p">&quot;</span> <span class="kt">not</span> <span class="o">=&gt;</span> <span class="nf">userexists</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(user)</span><span class="s">&quot;</span><span class="p">);</span> 

  <span class="kd">commands</span><span class="p">:</span> 
    <span class="nc">linux</span><span class="p">::</span>
      <span class="p">&quot;</span><span class="nv">/usr/sbin/useradd $($(info)[$(user)][flags]) -u $($(info)[$(user)][uid]) </span>
<span class="nv">-g $($(info)[$(user)][gid]) -d $($(info)[$(user)][home]) </span>
<span class="nv">-s $($(info)[$(user)][shell]) -c &#39;$($(info)[$(user)][fullname])&#39; $(user)</span><span class="p">&quot;</span>
        <span class="kt">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;add_</span><span class="si">$(user)</span><span class="s">&quot;</span><span class="p">;</span>
    <span class="nc">windows</span><span class="p">::</span>
      <span class="s">&quot;c:/Windows/system32/net user </span><span class="si">$(user)</span><span class="s"> </span><span class="si">$($(info)[$(user)][password])</span><span class="s"> /add </span>
<span class="se">\&quot;</span><span class="s">/fullname:</span><span class="si">$($(info)[$(user)][fullname])</span><span class="se">\&quot;</span><span class="s"> </span><span class="se">\&quot;</span><span class="s">/homedir:</span><span class="si">$($(info)[$(user)][home])</span><span class="se">\&quot;</span><span class="s">&quot;</span>
        <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;add_</span><span class="si">$(user)</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="c">### On Windows we use a command to set the password inconditionally in case it has changed.</span>
      <span class="s">&quot;c:/Windows/system32/net user </span><span class="si">$(user)</span><span class="s"> </span><span class="si">$($(info)[$(user)][password])</span><span class="s">&quot;</span><span class="p">;</span> 

  <span class="kd">files</span><span class="p">:</span>
      <span class="c">### This is not conditioned to the add_* classes to always check and reset the passwords if needed.</span>
    <span class="nc">linux</span><span class="p">::</span>
      <span class="p">&quot;</span><span class="nv">/etc/shadow</span><span class="p">&quot;</span> 
        <span class="kt">edit_line</span> <span class="o">=&gt;</span> <span class="nf">set_user_field</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(user)</span><span class="s">&quot;</span><span class="p">,</span> <span class="mi">2</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$($(info)[$(user)][password])</span><span class="s">&quot;</span><span class="p">);</span>

  <span class="kd">reports</span><span class="p">:</span> 
    <span class="nc">!linux.!windows</span><span class="p">::</span>
      <span class="s">&quot;I only know how to create users under Linux and Windows.&quot;</span><span class="p">;</span>
    <span class="nc">verbose_mode</span><span class="p">::</span>
      <span class="p">&quot;</span><span class="nv">Created user $(user)</span><span class="p">&quot;</span>
        <span class="kt">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;add_</span><span class="si">$(user)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
