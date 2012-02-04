---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch06/default.cf.sub.html
posttitle: Code > Chapter 6 > default.cf.sub
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch06/default.cf.sub)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">common</span> <span class="nf">G</span>
<span class="p">{</span>
<span class="kd">classes</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">bin_sort</span><span class="p">&quot;</span> <span class="kt">expression</span> <span class="o">=&gt;</span> <span class="nf">fileexists</span><span class="p">(</span><span class="s">&quot;/bin/sort&quot;</span><span class="p">);</span>
  <span class="p">&quot;</span><span class="nv">usr_bin_sort</span><span class="p">&quot;</span> <span class="kt">expression</span> <span class="o">=&gt;</span> <span class="nf">fileexists</span><span class="p">(</span><span class="s">&quot;/usr/bin/sort&quot;</span><span class="p">);</span>

  <span class="p">&quot;</span><span class="nv">bin_touch</span><span class="p">&quot;</span> <span class="kt">expression</span> <span class="o">=&gt;</span> <span class="nf">fileexists</span><span class="p">(</span><span class="s">&quot;/bin/touch&quot;</span><span class="p">);</span>
  <span class="p">&quot;</span><span class="nv">usr_bin_touch</span><span class="p">&quot;</span> <span class="kt">expression</span> <span class="o">=&gt;</span> <span class="nf">fileexists</span><span class="p">(</span><span class="s">&quot;/usr/bin/touch&quot;</span><span class="p">);</span>

  <span class="p">&quot;</span><span class="nv">temp_declared</span><span class="p">&quot;</span> <span class="kt">not</span> <span class="o">=&gt;</span> <span class="nf">strcmp</span><span class="p">(</span><span class="nf">getenv</span><span class="p">(</span><span class="s">&quot;TEMP&quot;</span><span class="p">,</span> <span class="s">&quot;65536&quot;</span><span class="p">),</span> <span class="s">&quot;&quot;</span><span class="p">);</span>

<span class="kd">vars</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">cwd</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">execresult</span><span class="p">(</span><span class="s">&quot;/bin/pwd&quot;</span><span class="p">,</span> <span class="s">&quot;noshell&quot;</span><span class="p">);</span>

  <span class="nc">temp_declared</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">testroot</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">getenv</span><span class="p">(</span><span class="s">&quot;TEMP&quot;</span><span class="p">,</span> <span class="s">&quot;65535&quot;</span><span class="p">);</span>
    <span class="p">&quot;</span><span class="nv">testdir</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">concat</span><span class="p">(</span><span class="nf">getenv</span><span class="p">(</span><span class="s">&quot;TEMP&quot;</span><span class="p">,</span> <span class="s">&quot;65535&quot;</span><span class="p">),</span> <span class="s">&quot;/TEST.cfengine&quot;</span><span class="p">);</span>
    <span class="p">&quot;</span><span class="nv">testfile</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">concat</span><span class="p">(</span><span class="nf">getenv</span><span class="p">(</span><span class="s">&quot;TEMP&quot;</span><span class="p">,</span> <span class="s">&quot;65535&quot;</span><span class="p">),</span> <span class="s">&quot;/TEST.cfengine&quot;</span><span class="p">);</span>

  <span class="nc">!temp_declared</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">testroot</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/tmp&quot;</span><span class="p">;</span>
    <span class="p">&quot;</span><span class="nv">testdir</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/tmp/TEST.cfengine&quot;</span><span class="p">;</span>
    <span class="p">&quot;</span><span class="nv">testfile</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/tmp/TEST.cfengine&quot;</span><span class="p">;</span>

  <span class="nc">bin_sort</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">sort</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/sort&quot;</span><span class="p">;</span>
  <span class="nc">!bin_sort.usr_bin_sort</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">sort</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/sort&quot;</span><span class="p">;</span>

  <span class="nc">bin_touch</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">touch</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/touch&quot;</span><span class="p">;</span>
  <span class="nc">!bin_touch.usr_bin_touch</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">touch</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/touch&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">common</span> <span class="nf">paths_init</span><span class="p">(</span><span class="nv">filename</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">classes</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">filename_absolute</span><span class="p">&quot;</span> <span class="kt">expression</span> <span class="o">=&gt;</span> <span class="nf">regcmp</span><span class="p">(</span><span class="s">&quot;/.*&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(filename)</span><span class="s">&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">common</span> <span class="nf">paths</span><span class="p">(</span><span class="nv">filename</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="nc">filename_absolute</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">input_file</span><span class="p">&quot;</span>
      <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(filename)</span><span class="s">&quot;</span><span class="p">;</span>
  <span class="nc">!filename_absolute</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">input_file</span><span class="p">&quot;</span>
      <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(G.cwd)</span><span class="s">/</span><span class="si">$(filename)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">default</span><span class="p">(</span><span class="nv">filename</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
    <span class="p">&quot;</span><span class="nv">tests</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;init&quot;</span><span class="p">,</span> <span class="s">&quot;test&quot;</span><span class="p">,</span> <span class="s">&quot;check&quot;</span> <span class="p">};</span>

<span class="kd">methods</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">any</span><span class="p">&quot;</span>
    <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">paths_init</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(filename)</span><span class="s">&quot;</span><span class="p">);</span>
  <span class="p">&quot;</span><span class="nv">any</span><span class="p">&quot;</span>
    <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">paths</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(filename)</span><span class="s">&quot;</span><span class="p">);</span>

  <span class="nc">AUTO</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">any</span><span class="p">&quot;</span> <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(tests)</span><span class="s">&quot;</span><span class="p">;</span>

<span class="kd">reports</span><span class="p">:</span>
    <span class="nc">!AUTO</span><span class="p">::</span>
    <span class="s">&quot;# You must either specify &#39;-D AUTO&#39; or run the following commands:&quot;</span><span class="p">;</span>
    <span class="s">&quot;cf-agent -f ./</span><span class="si">$(filename)</span><span class="s"> -b </span><span class="si">$(tests)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#######################################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">default_sort</span><span class="p">(</span><span class="nv">infile</span><span class="p">,</span> <span class="nv">outfile</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">commands</span><span class="p">:</span>
    <span class="p">&quot;</span><span class="nv">$(G.sort) $(infile) &gt; $(outfile)</span><span class="p">&quot;</span>
    <span class="kt">contain</span> <span class="o">=&gt;</span> <span class="nf">default_shell_command</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">default_check_diff</span><span class="p">(</span><span class="nv">file1</span><span class="p">,</span> <span class="nv">file2</span><span class="p">,</span> <span class="nv">test</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">methods</span><span class="p">:</span>
        <span class="p">&quot;</span><span class="nv">any</span><span class="p">&quot;</span> <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">check_diff</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(file1)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(file2)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(test)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;no&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">sorted_check_diff</span><span class="p">(</span><span class="nv">file1</span><span class="p">,</span> <span class="nv">file2</span><span class="p">,</span> <span class="nv">test</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">methods</span><span class="p">:</span>
        <span class="p">&quot;</span><span class="nv">any</span><span class="p">&quot;</span> <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">default_sort</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(file1)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(file1)</span><span class="s">.sort&quot;</span><span class="p">);</span>
        <span class="p">&quot;</span><span class="nv">any</span><span class="p">&quot;</span> <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">default_sort</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(file2)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(file2)</span><span class="s">.sort&quot;</span><span class="p">);</span>
        <span class="p">&quot;</span><span class="nv">any</span><span class="p">&quot;</span> <span class="kt">usebundle</span> <span class="o">=&gt;</span> <span class="nf">check_diff</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(file1)</span><span class="s">.sort&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(file2)</span><span class="s">.sort&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(test)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;no&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">check_diff</span><span class="p">(</span><span class="nv">file1</span><span class="p">,</span> <span class="nv">file2</span><span class="p">,</span> <span class="nv">test</span><span class="p">,</span> <span class="nv">expected_difference</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
    <span class="nc">DEBUG.!no_difference</span><span class="p">::</span>
        <span class="p">&quot;</span><span class="nv">file1r</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">readfile</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(file1)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;9999999999&quot;</span><span class="p">);</span>
        <span class="p">&quot;</span><span class="nv">file1h</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">execresult</span><span class="p">(</span><span class="s">&quot;/usr/bin/hexdump -C </span><span class="si">$(file1)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;useshell&quot;</span><span class="p">);</span>
        <span class="p">&quot;</span><span class="nv">file2r</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">readfile</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(file2)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;9999999999&quot;</span><span class="p">);</span>
        <span class="p">&quot;</span><span class="nv">file2h</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">execresult</span><span class="p">(</span><span class="s">&quot;/usr/bin/hexdump -C </span><span class="si">$(file2)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;useshell&quot;</span><span class="p">);</span>
        <span class="p">&quot;</span><span class="nv">diffu</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">execresult</span><span class="p">(</span><span class="s">&quot;/usr/bin/diff -u </span><span class="si">$(file2)</span><span class="s"> </span><span class="si">$(file1)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;noshell&quot;</span><span class="p">);</span>

<span class="kd">classes</span><span class="p">:</span>
    <span class="p">&quot;</span><span class="nv">no_difference</span><span class="p">&quot;</span> <span class="kt">expression</span> <span class="o">=&gt;</span> <span class="nf">returnszero</span><span class="p">(</span>
        <span class="s">&quot;/usr/bin/diff -q </span><span class="si">$(file1)</span><span class="s"> </span><span class="si">$(file2)</span><span class="s">&quot;</span><span class="p">,</span>
        <span class="s">&quot;useshell&quot;</span><span class="p">);</span>

        <span class="p">&quot;</span><span class="nv">expected_difference</span><span class="p">&quot;</span> <span class="kt">expression</span> <span class="o">=&gt;</span> <span class="nf">strcmp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(expected_difference)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;yes&quot;</span><span class="p">);</span>

<span class="kd">reports</span><span class="p">:</span>
    <span class="nc">no_difference.!expected_difference</span><span class="p">::</span>
    <span class="s">&quot;</span><span class="si">$(test)</span><span class="s"> Pass&quot;</span><span class="p">;</span>
    <span class="nc">!no_difference.expected_difference</span><span class="p">::</span>
    <span class="s">&quot;</span><span class="si">$(test)</span><span class="s"> Pass&quot;</span><span class="p">;</span>
    <span class="nc">!no_difference.!expected_difference</span><span class="p">::</span>
    <span class="s">&quot;</span><span class="si">$(test)</span><span class="s"> FAIL&quot;</span><span class="p">;</span>
    <span class="nc">no_difference.expected_difference</span><span class="p">::</span>
    <span class="s">&quot;</span><span class="si">$(test)</span><span class="s"> FAIL&quot;</span><span class="p">;</span>

    <span class="nc">DEBUG.!no_difference.!expected_difference</span><span class="p">::</span>
        <span class="s">&quot;</span><span class="si">$(file1)</span><span class="s"> and </span><span class="si">$(file2)</span><span class="s"> differ:&quot;</span><span class="p">;</span>
        <span class="s">&quot;</span><span class="si">$(file1)</span><span class="s">: &lt;</span><span class="si">$(file1r)</span><span class="s">&gt;&quot;</span><span class="p">;</span>
        <span class="s">&quot;</span><span class="si">$(file2)</span><span class="s">: &lt;</span><span class="si">$(file2r)</span><span class="s">&gt;&quot;</span><span class="p">;</span>
        <span class="s">&quot;hexdump </span><span class="si">$(file1)</span><span class="s">:</span>
<span class="si">$(file1h)</span><span class="s">&quot;</span><span class="p">;</span>
        <span class="s">&quot;hexdump </span><span class="si">$(file2)</span><span class="s">:</span>
<span class="si">$(file2h)</span><span class="s">&quot;</span><span class="p">;</span>
        <span class="s">&quot;</span><span class="si">$(diffu)</span><span class="s">&quot;</span><span class="p">;</span>
    <span class="nc">DEBUG.no_difference.expected_difference</span><span class="p">::</span>
        <span class="s">&quot;Contents of </span><span class="si">$(file1)</span><span class="s"> and </span><span class="si">$(file)</span><span class="s"> is the same.&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">default_shell_command</span>
<span class="p">{</span>
<span class="kr">useshell</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#######################################################</span>

<span class="c"># Uses rm -rf instead of selecting and deleting files to avoid side-effects in</span>
<span class="c"># tests due to problems in file deleletion promises.</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">default_fini</span><span class="p">(</span><span class="nv">file</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">commands</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">/bin/rm -rf $(file)*</span><span class="p">&quot;</span>
    <span class="kt">contain</span> <span class="o">=&gt;</span> <span class="nf">useshell</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">/bin/rm -rf $(sys.workdir)/state/cf_state.*</span><span class="p">&quot;</span>
    <span class="kt">contain</span> <span class="o">=&gt;</span> <span class="nf">useshell</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">useshell</span>
<span class="p">{</span>
  <span class="kr">useshell</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
  <span class="kr">chdir</span> <span class="o">=&gt;</span> <span class="s">&quot;/&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
