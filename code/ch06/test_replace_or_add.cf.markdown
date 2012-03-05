---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch06/test_replace_or_add.cf.html
posttitle: Code > Chapter 6 > test_replace_or_add.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch06/test_replace_or_add.cf)

<div class="highlight"><pre><span class="c">#######################################################</span>
<span class="c">#</span>
<span class="c"># Test replace_or_add()</span>
<span class="c">#</span>
<span class="c">#######################################################</span>

<span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">inputs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;../../default.cf.sub&quot;</span><span class="p">,</span>   
                    <span class="s">&quot;../../../../masterfiles/cfengine_stdlib.cf&quot;</span>   
                  <span class="p">};</span>
        <span class="kr">bundlesequence</span>  <span class="o">=&gt;</span> <span class="p">{</span> <span class="nf">default</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(this.promise_filename)</span><span class="s">&quot;</span><span class="p">)</span> <span class="p">};</span>   
        <span class="kr">version</span> <span class="o">=&gt;</span> <span class="s">&quot;1.0&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#######################################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">init</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">states</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;actual&quot;</span><span class="p">,</span> <span class="s">&quot;expected&quot;</span> <span class="p">};</span>   

      <span class="p">&quot;</span><span class="nv">actual</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span>   
      <span class="s">&quot;BEGIN</span>
<span class="s">line1 plus more text</span>
<span class="s">END&quot;</span><span class="p">;</span>

      <span class="p">&quot;</span><span class="nv">expected</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span>
      <span class="s">&quot;BEGIN</span>
<span class="s">new line 1</span>
<span class="s">END</span>
<span class="s">new line 2&quot;</span><span class="p">;</span>

  <span class="kd">files</span><span class="p">:</span>
      <span class="s">&quot;</span><span class="si">$(G.testfile)</span><span class="s">.</span><span class="si">$(states)</span><span class="s">&quot;</span>   
        <span class="kr">create</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">,</span>
        <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">init_insert</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(init.$(states))</span><span class="s">&quot;</span><span class="p">),</span>
        <span class="kr">edit_defaults</span> <span class="o">=&gt;</span> <span class="nf">init_empty</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">init_insert</span><span class="p">(</span><span class="nv">str</span><span class="p">)</span>   
<span class="p">{</span>
  <span class="kd">insert_lines</span><span class="p">:</span>
      <span class="s">&quot;</span><span class="si">$(str)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">body</span> <span class="k">edit_defaults</span> <span class="nf">init_empty</span>
<span class="p">{</span>
        <span class="kr">empty_file_before_editing</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#######################################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">tpat1</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;line1.*&quot;</span><span class="p">;</span>    
      <span class="p">&quot;</span><span class="nv">tstr1</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;new line 1&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">tpat2</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;line2.*&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">tstr2</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;new line 2&quot;</span><span class="p">;</span>

  <span class="kd">files</span><span class="p">:</span>
      <span class="s">&quot;</span><span class="si">$(G.testfile)</span><span class="s">.actual&quot;</span>   
        <span class="kr">create</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">,</span>
        <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">replace_or_add</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(test.tpat1)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(test.tstr1)</span><span class="s">&quot;</span><span class="p">);</span>
      <span class="s">&quot;</span><span class="si">$(G.testfile)</span><span class="s">.actual&quot;</span>
        <span class="kr">create</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">,</span>
        <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">replace_or_add</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(test.tpat2)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(test.tstr2)</span><span class="s">&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="c">#######################################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">check</span>
<span class="p">{</span>
  <span class="kd">methods</span><span class="p">:</span>
      <span class="s">&quot;any&quot;</span> <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">default_check_diff</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(G.testfile)</span><span class="s">.actual&quot;</span><span class="p">,</span>
                                            <span class="s">&quot;</span><span class="si">$(G.testfile)</span><span class="s">.expected&quot;</span><span class="p">,</span>
                                            <span class="s">&quot;</span><span class="si">$(this.promise_filename)</span><span class="s">&quot;</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
