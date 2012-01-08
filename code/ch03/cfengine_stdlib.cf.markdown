---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/cfengine_stdlib.cf.html
posttitle: Code > Chapter 3 > cfengine_stdlib.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/cfengine_stdlib.cf)

<div class="highlight"><pre><span class="c">###########################################################################</span>
<span class="c">#  Copyright (C) Cfengine AS</span>
<span class="c"># </span>
<span class="c">#  This program is free software; you can redistribute it and/or modify it</span>
<span class="c">#  under the terms of the GNU Lesser General Public License LGPL as published by the</span>
<span class="c">#  Free Software Foundation; version 3.</span>
<span class="c">#   </span>
<span class="c">#  This program is distributed in the hope that it will be useful,</span>
<span class="c">#  but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="c">#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="c">#  GNU General Public License for more details.</span>
<span class="c">#</span>
<span class="c">#  To the extent this program is licensed as part of the Enterprise</span>
<span class="c">#  versions of Cfengine, the applicable Commerical Open Source License</span>
<span class="c">#  (COSL) may apply to this file if you as a licensee so wish it. See</span>
<span class="c">#  included file COSL.txt.</span>
<span class="c">###########################################################################</span>
<span class="c">#</span>
<span class="c"># Cfengine Community Open Promise-Body Library</span>
<span class="c">#</span>
<span class="c"># This initiative started by Cfengine promotes a</span>
<span class="c"># standardized set of names and promise specifications</span>
<span class="c"># for template functionality within Cfengine 3.</span>
<span class="c">#</span>
<span class="c"># The aim is to promote an industry standard for</span>
<span class="c"># naming of configuration patterns, leading to a</span>
<span class="c"># de facto middleware of standardized syntax.</span>
<span class="c">#</span>
<span class="c"># Names should be intuitive and parameters should be</span>
<span class="c"># minimal to assist readability and comprehensibility.</span>

<span class="c"># Contributions to this file are voluntarily given to</span>
<span class="c"># the cfengine community, and are moderated by Cfengine.</span>
<span class="c"># No liability or warranty for misuse is implied.</span>
<span class="c">#</span>
<span class="c"># If you add to this file, please try to make the</span>
<span class="c"># contributions &quot;self-documenting&quot;. Comments made</span>
<span class="c"># after the bundle/body statement are retained in</span>
<span class="c"># the online docs</span>
<span class="c">#</span>

<span class="c"># Subversion : $Rev$</span>
<span class="c"># For Cfengine Core: 3.1.0</span>

<span class="c">###################################################</span>
<span class="c"># If you find Cfengine useful, please consider    #</span>
<span class="c"># purchasing a commercial version of the software.#</span>
<span class="c">###################################################</span>

<span class="c">###################################################</span>
<span class="c"># edit_line bundles</span>
<span class="c">###################################################</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">insert_lines</span><span class="p">(</span><span class="nv">lines</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">insert_lines</span><span class="p">:</span>

  <span class="s">&quot;</span><span class="si">$(lines)</span><span class="s">&quot;</span>
    <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Append lines if they don&#39;t exist&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">insert_file</span><span class="p">(</span><span class="nv">templatefile</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">insert_lines</span><span class="p">:</span>

   <span class="s">&quot;</span><span class="si">$(templatefile)</span><span class="s">&quot;</span>
            <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Insert the template file into the file being edited&quot;</span><span class="p">,</span>
        <span class="kr">insert_type</span> <span class="o">=&gt;</span> <span class="s">&quot;file&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">comment_lines_matching</span><span class="p">(</span><span class="nv">regex</span><span class="p">,</span><span class="nv">comment</span><span class="p">)</span>

 <span class="c"># Comment lines of a file matching a regex</span>

<span class="p">{</span>
<span class="kd">replace_patterns</span><span class="p">:</span>
	 
 <span class="s">&quot;^(</span><span class="si">$(regex)</span><span class="s">)$&quot;</span> 

     <span class="kr">replace_with</span> <span class="o">=&gt;</span> <span class="nf">comment</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(comment)</span><span class="s">&quot;</span><span class="p">),</span>
          <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Search and replace string&quot;</span><span class="p">;</span>
<span class="p">}</span>
	 
<span class="c">##</span>
	 
<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">uncomment_lines_matching</span><span class="p">(</span><span class="nv">regex</span><span class="p">,</span><span class="nv">comment</span><span class="p">)</span>
	 
 <span class="c"># Uncomment lines of a file where the regex matches</span>
 <span class="c"># the text after the comment string</span>
	 
<span class="p">{</span>
<span class="kd">replace_patterns</span><span class="p">:</span>
 
 <span class="s">&quot;^</span><span class="si">$(comment)</span><span class="se">\s</span><span class="s">?(</span><span class="si">$(regex)</span><span class="s">)$&quot;</span> 

       <span class="kr">replace_with</span> <span class="o">=&gt;</span> <span class="nf">uncomment</span><span class="p">,</span>
            <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Uncomment lines matching a regular expression&quot;</span><span class="p">;</span>
<span class="p">}</span>
	 
<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">comment_lines_containing</span><span class="p">(</span><span class="nv">regex</span><span class="p">,</span><span class="nv">comment</span><span class="p">)</span>

 <span class="c"># Comment lines of a file containing a regex</span>

<span class="p">{</span>
<span class="kd">replace_patterns</span><span class="p">:</span>
 
 <span class="s">&quot;^(.*</span><span class="si">$(regex)</span><span class="s">.*)$&quot;</span> 

     <span class="kr">replace_with</span> <span class="o">=&gt;</span> <span class="nf">comment</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(comment)</span><span class="s">&quot;</span><span class="p">),</span>
          <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Comment out lines in a file&quot;</span><span class="p">;</span>
<span class="p">}</span>
	 
<span class="c">##</span>
	 
<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">uncomment_lines_containing</span><span class="p">(</span><span class="nv">regex</span><span class="p">,</span><span class="nv">comment</span><span class="p">)</span>
	 
 <span class="c"># Uncomment lines of a file where the regex matches</span>
 <span class="c"># the text after the comment string</span>
	 
<span class="p">{</span>
<span class="kd">replace_patterns</span><span class="p">:</span>
 
 <span class="s">&quot;^</span><span class="si">$(comment)</span><span class="se">\s</span><span class="s">?(.*</span><span class="si">$(regex)</span><span class="s">.*)$&quot;</span> 

    <span class="kr">replace_with</span> <span class="o">=&gt;</span> <span class="nf">uncomment</span><span class="p">,</span>
         <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Uncomment a line containing a fragment&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">delete_lines_matching</span><span class="p">(</span><span class="nv">regex</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">delete_lines</span><span class="p">:</span>

  <span class="s">&quot;</span><span class="si">$(regex)</span><span class="s">&quot;</span>

     <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Delete lines matching regular expressions&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">warn_lines_matching</span><span class="p">(</span><span class="nv">regex</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">delete_lines</span><span class="p">:</span>

  <span class="s">&quot;</span><span class="si">$(regex)</span><span class="s">&quot;</span>  

   <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Warn about lines in a file&quot;</span><span class="p">,</span>
    <span class="kr">action</span> <span class="o">=&gt;</span> <span class="nf">warn_only</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">append_if_no_line</span><span class="p">(</span><span class="nv">str</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">insert_lines</span><span class="p">:</span>

 <span class="s">&quot;</span><span class="si">$(str)</span><span class="s">&quot;</span>

     <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Append a line to the file if it doesn&#39;t already exist&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">append_if_no_lines</span><span class="p">(</span><span class="nv">list</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">insert_lines</span><span class="p">:</span>

 <span class="s">&quot;</span><span class="si">$(list)</span><span class="s">&quot;</span>

   <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Append lines to the file if they don&#39;t already exist&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">replace_line_end</span><span class="p">(</span><span class="nv">start</span><span class="p">,</span><span class="nv">end</span><span class="p">)</span>
<span class="c">#</span>
<span class="c"># Lines starting with &quot;$(start)&quot; will get the ending given in &quot;$(end)&quot;,</span>
<span class="c"># whitespaces will be left unmodified.</span>
<span class="c"># For example, replace_line_end(&quot;ftp&quot;, &quot;2121/tcp&quot;) would replace</span>
<span class="c"># &quot;ftp             21/tcp&quot;</span>
<span class="c"># with </span>
<span class="c"># &quot;ftp             2121/tcp&quot;</span>
<span class="p">{</span>
<span class="kd">field_edits</span><span class="p">:</span>

   <span class="s">&quot;</span><span class="se">\s</span><span class="s">*</span><span class="si">$(start)</span><span class="se">\s</span><span class="s">.*&quot;</span>
      <span class="kr">edit_field</span> <span class="o">=&gt;</span> <span class="nf">line</span><span class="p">(</span><span class="s">&quot;(^|</span><span class="se">\s</span><span class="s">)</span><span class="si">$(start)</span><span class="se">\s</span><span class="s">*&quot;</span><span class="p">,</span> <span class="s">&quot;2&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(end)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;set&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">append_to_line_end</span><span class="p">(</span><span class="nv">start</span><span class="p">,</span><span class="nv">end</span><span class="p">)</span>
<span class="c">#</span>
<span class="c"># Lines starting with &quot;$(start)&quot; and not ending with &quot;$(end)&quot;</span>
<span class="c"># will get appended with &quot;$(end)&quot;, whitespaces will be left unmodified.</span>
<span class="c"># For example, append_to_line_end(&quot;kernel&quot;, &quot;vga=791&quot;) would replace</span>
<span class="c"># &quot;kernel /boot/vmlinuz root=/dev/sda7&quot;</span>
<span class="c"># with </span>
<span class="c"># &quot;kernel /boot/vmlinuz root=/dev/sda7 resume=/dev/sda9 vga=791&quot;</span>
<span class="c">#</span>
<span class="c"># WARNING: Be careful not to have multiple promises matching the same line,</span>
<span class="c">#          which would result in the line growing indefinetively.</span>
<span class="p">{</span>
<span class="kd">field_edits</span><span class="p">:</span>

   <span class="s">&quot;</span><span class="se">\s</span><span class="s">*</span><span class="si">$(start)</span><span class="se">\s</span><span class="s">.*&quot;</span>
      <span class="kr">edit_field</span> <span class="o">=&gt;</span> <span class="nf">line</span><span class="p">(</span><span class="s">&quot;(^|</span><span class="se">\s</span><span class="s">)</span><span class="si">$(start)</span><span class="se">\s</span><span class="s">*&quot;</span><span class="p">,</span> <span class="s">&quot;2&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(end)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;append&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">resolvconf</span><span class="p">(</span><span class="nv">search</span><span class="p">,</span><span class="nv">list</span><span class="p">)</span>

 <span class="c"># search is the search domains with space</span>
 <span class="c"># list is an slist of nameserver addresses</span>

<span class="p">{</span>
<span class="kd">delete_lines</span><span class="p">:</span>

  <span class="s">&quot;search.*&quot;</span>     <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Reset search lines from resolver&quot;</span><span class="p">;</span>
  <span class="s">&quot;nameserver.*&quot;</span> <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Reset nameservers in resolver&quot;</span><span class="p">;</span>

<span class="kd">insert_lines</span><span class="p">:</span>

  <span class="s">&quot;search </span><span class="si">$(search)</span><span class="s">&quot;</span>    <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Add search domains to resolver&quot;</span><span class="p">;</span>
  <span class="s">&quot;nameserver </span><span class="si">$(list)</span><span class="s">&quot;</span>  <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Add name servers to resolver&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">set_variable_values</span><span class="p">(</span><span class="nv">v</span><span class="p">)</span> 

 <span class="c"># Sets the RHS of variables in the file of the form</span>
 <span class="c">#   LHS = RHS</span>
 <span class="c"># Adds a new line if no LHS exists, repairs RHS values if one does exist</span>
 <span class="c">#</span>
 <span class="c"># To use:</span>
 <span class="c">#   1) Define an array, where the keys are the LHS and the values are the RHS</span>
 <span class="c">#        &quot;stuff[lhs-1]&quot; string =&gt; &quot;rhs1&quot;;</span>
 <span class="c">#        &quot;stuff[lhs-2]&quot; string =&gt; &quot;rhs2&quot;;</span>
 <span class="c">#   2) The parameter passed to the edit_line promise is the fully qualified</span>
 <span class="c">#      name of the array (i.e., &quot;bundlename.stuff&quot;) WITHOUT any &quot;$&quot; or &quot;@&quot;</span>

<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>

  <span class="p">&quot;</span><span class="nv">index</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(v)</span><span class="s">&quot;</span><span class="p">);</span> 

  <span class="c"># Be careful if the index string contains funny chars</span>

  <span class="p">&quot;</span><span class="nv">cindex[$(index)]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">canonify</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(index)</span><span class="s">&quot;</span><span class="p">);</span> 

<span class="kd">field_edits</span><span class="p">:</span> 

  <span class="c"># match a line starting like the key = something</span>

  <span class="s">&quot;</span><span class="se">\s</span><span class="s">*</span><span class="si">$(index)</span><span class="se">\s</span><span class="s">*=.*&quot;</span> 

     <span class="kr">edit_field</span> <span class="o">=&gt;</span> <span class="nf">col</span><span class="p">(</span><span class="s">&quot;=&quot;</span><span class="p">,</span><span class="s">&quot;2&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$($(v)[$(index)])</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;set&quot;</span><span class="p">),</span> 
        <span class="kr">classes</span> <span class="o">=&gt;</span> <span class="nf">if_ok</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(cindex[$(index)])</span><span class="s">_in_file&quot;</span><span class="p">),</span>   
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Match a line starting like key = something&quot;</span><span class="p">;</span>

<span class="kd">insert_lines</span><span class="p">:</span> 

  <span class="s">&quot;</span><span class="si">$(index)</span><span class="s">=</span><span class="si">$($(v)[$(index)])</span><span class="s">&quot;</span><span class="p">,</span>

         <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Insert a variable definition&quot;</span><span class="p">,</span>
      <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;!</span><span class="si">$(cindex[$(index)])</span><span class="s">_in_file&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">set_config_values</span><span class="p">(</span><span class="nv">v</span><span class="p">)</span>

 <span class="c"># Sets the RHS of configuration items in the file of the form</span>
 <span class="c">#   LHS RHS</span>
 <span class="c"># If the line is commented out with #, it gets uncommented first.</span>
 <span class="c"># Adds a new line if none exists.</span>
 <span class="c"># The argument is the fully-qualified name of an associative array containing v[LHS]=&quot;rhs&quot;</span>
 
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">index</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(v)</span><span class="s">&quot;</span><span class="p">);</span> 

  <span class="c"># Be careful if the index string contains funny chars</span>
  <span class="p">&quot;</span><span class="nv">cindex[$(index)]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">canonify</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(index)</span><span class="s">&quot;</span><span class="p">);</span>

<span class="kd">replace_patterns</span><span class="p">:</span> 
  <span class="c"># If the line is there, maybe commented out, uncomment and replace with</span>
  <span class="c"># the correct value</span>
  <span class="s">&quot;^</span><span class="se">\s</span><span class="s">*(</span><span class="si">$(index)</span><span class="se">\s</span><span class="s">+(?!</span><span class="si">$($(v)[$(index)])</span><span class="s">).*|# ?</span><span class="si">$(index)</span><span class="se">\s</span><span class="s">+.*)$&quot;</span>
    <span class="kr">replace_with</span> <span class="o">=&gt;</span> <span class="nf">value</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(index)</span><span class="s"> </span><span class="si">$($(v)[$(index)])</span><span class="s">&quot;</span><span class="p">),</span> 
    <span class="kr">classes</span> <span class="o">=&gt;</span> <span class="nf">always</span><span class="p">(</span><span class="s">&quot;replace_attempted_</span><span class="si">$(cindex[$(index)])</span><span class="s">&quot;</span><span class="p">);</span> 

<span class="kd">insert_lines</span><span class="p">:</span>
  <span class="s">&quot;</span><span class="si">$(index)</span><span class="s"> </span><span class="si">$($(v)[$(index)])</span><span class="s">&quot;</span> 
    <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;replace_attempted_</span><span class="si">$(cindex[$(index)])</span><span class="s">&quot;</span><span class="p">;</span>

<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">set_variable_values2</span><span class="p">(</span><span class="nv">file</span><span class="p">,</span><span class="nv">v</span><span class="p">)</span>
<span class="c">#</span>
<span class="c"># Another implementation of set_variable_values.</span>
<span class="c"># The input and output should be exactly the same (except the file name), </span>
<span class="c"># but in some Cfengine versions there are bugs, </span>
<span class="c"># so this bundle can be used as a workaround.</span>
<span class="c">#</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>

  <span class="p">&quot;</span><span class="nv">index</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(v)</span><span class="s">&quot;</span><span class="p">);</span>

  <span class="c"># Be careful if the index string contains funny chars</span>

  <span class="p">&quot;</span><span class="nv">cindex[$(index)]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">canonify</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(index)</span><span class="s">&quot;</span><span class="p">);</span>

  <span class="p">&quot;</span><span class="nv">fieldc_$(cindex[$(index)])</span><span class="p">&quot;</span> <span class="kt">int</span> <span class="o">=&gt;</span> <span class="nf">getfields</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(index)</span><span class="s">.*&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(file)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;=&quot;</span><span class="p">,</span><span class="s">&quot;FIELD_</span><span class="si">$(cindex[$(index)])</span><span class="s">&quot;</span><span class="p">);</span>

<span class="kd">classes</span><span class="p">:</span>
  <span class="s">&quot;</span><span class="si">$(cindex[$(index)])</span><span class="s">_in_file&quot;</span> <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">strcmp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(index)</span><span class="s">=</span><span class="si">$($(v)[$(index)])</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(FIELD_$(index)[1])</span><span class="s">=</span><span class="si">$(FIELD_$(index)[2])</span><span class="s">&quot;</span><span class="p">);</span>


<span class="kd">delete_lines</span><span class="p">:</span>  <span class="c"># delete any lhs when no match</span>
  <span class="s">&quot;</span><span class="si">$(index)</span><span class="s">=.*&quot;</span><span class="p">,</span>
    <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;!</span><span class="si">$(cindex[$(index)])</span><span class="s">_in_file&quot;</span><span class="p">;</span>


<span class="kd">insert_lines</span><span class="p">:</span>

  <span class="s">&quot;</span><span class="si">$(index)</span><span class="s">=</span><span class="si">$($(v)[$(index)])</span><span class="s">&quot;</span><span class="p">,</span>

         <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Insert a variable definition&quot;</span><span class="p">,</span>
      <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;!</span><span class="si">$(cindex[$(index)])</span><span class="s">_in_file&quot;</span><span class="p">;</span>

<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">append_users_starting</span><span class="p">(</span><span class="nv">v</span><span class="p">)</span>

 <span class="c"># For adding to /etc/passwd or etc/shadow, needs</span>
 <span class="c"># an array v[username] string =&gt; &quot;line...&quot;</span>

<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>

  <span class="p">&quot;</span><span class="nv">index</span><span class="p">&quot;</span>        <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(v)</span><span class="s">&quot;</span><span class="p">);</span>

<span class="kd">classes</span><span class="p">:</span>

  <span class="s">&quot;add_</span><span class="si">$(index)</span><span class="s">&quot;</span> <span class="kr">not</span> <span class="o">=&gt;</span> <span class="nf">userexists</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(index)</span><span class="s">&quot;</span><span class="p">);</span>

<span class="kd">insert_lines</span><span class="p">:</span>

  <span class="s">&quot;</span><span class="si">$($(v)[$(index)])</span><span class="s">&quot;</span><span class="p">,</span>

         <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Append users into a password file format&quot;</span><span class="p">,</span>
      <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;add_</span><span class="si">$(index)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">append_groups_starting</span><span class="p">(</span><span class="nv">v</span><span class="p">)</span>

 <span class="c"># For adding groups to /etc/group, needs</span>
 <span class="c"># an array v[groupname] string =&gt; &quot;line...&quot;</span>

<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>

  <span class="p">&quot;</span><span class="nv">index</span><span class="p">&quot;</span>        <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(v)</span><span class="s">&quot;</span><span class="p">);</span>

<span class="kd">classes</span><span class="p">:</span>

  <span class="s">&quot;add_</span><span class="si">$(index)</span><span class="s">&quot;</span> <span class="kr">not</span> <span class="o">=&gt;</span> <span class="nf">groupexists</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(index)</span><span class="s">&quot;</span><span class="p">);</span>

<span class="kd">insert_lines</span><span class="p">:</span>

  <span class="s">&quot;</span><span class="si">$($(v)[$(index)])</span><span class="s">&quot;</span><span class="p">,</span>

         <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Append users into a group file format&quot;</span><span class="p">,</span>
      <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;add_</span><span class="si">$(index)</span><span class="s">&quot;</span><span class="p">;</span>

<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">set_colon_field</span><span class="p">(</span><span class="nv">key</span><span class="p">,</span><span class="nv">field</span><span class="p">,</span><span class="nv">val</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">field_edits</span><span class="p">:</span>
 <span class="s">&quot;</span><span class="si">$(key)</span><span class="s">:.*&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Edit a colon-separated file, using the first field as a key&quot;</span><span class="p">,</span>
     <span class="kr">edit_field</span> <span class="o">=&gt;</span> <span class="nf">col</span><span class="p">(</span><span class="s">&quot;:&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(field)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(val)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;set&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">set_user_field</span><span class="p">(</span><span class="nv">user</span><span class="p">,</span><span class="nv">field</span><span class="p">,</span><span class="nv">val</span><span class="p">)</span>

 <span class="c"># Set the value of field number &quot;field&quot; in</span>
 <span class="c"># a :-field formatted file like /etc/passwd</span>

<span class="p">{</span>
<span class="kd">field_edits</span><span class="p">:</span>

 <span class="s">&quot;</span><span class="si">$(user)</span><span class="s">:.*&quot;</span>

        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Edit a user attribute in the password file&quot;</span><span class="p">,</span>
     <span class="kr">edit_field</span> <span class="o">=&gt;</span> <span class="nf">col</span><span class="p">(</span><span class="s">&quot;:&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(field)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(val)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;set&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">append_user_field</span><span class="p">(</span><span class="nv">group</span><span class="p">,</span><span class="nv">field</span><span class="p">,</span><span class="nv">allusers</span><span class="p">)</span>

 <span class="c"># For adding users to to a file like /etc/group</span>
 <span class="c"># at field position &quot;field&quot;, comma separated subfields</span>

<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>

  <span class="p">&quot;</span><span class="nv">val</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="nv">@(allusers)</span> <span class="p">};</span>

<span class="kd">field_edits</span><span class="p">:</span>

 <span class="s">&quot;</span><span class="si">$(group)</span><span class="s">:.*&quot;</span>

       <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Append users into a password file format&quot;</span><span class="p">,</span>
    <span class="kr">edit_field</span> <span class="o">=&gt;</span> <span class="nf">col</span><span class="p">(</span><span class="s">&quot;:&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(field)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(val)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;alphanum&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">expand_template</span><span class="p">(</span><span class="nv">templatefile</span><span class="p">)</span>

 <span class="c"># Read in the named text file and expand $(var)</span>
 <span class="c"># inside the file</span>

<span class="p">{</span>
<span class="kd">insert_lines</span><span class="p">:</span>

   <span class="s">&quot;</span><span class="si">$(templatefile)</span><span class="s">&quot;</span>

        <span class="kr">insert_type</span> <span class="o">=&gt;</span> <span class="s">&quot;file&quot;</span><span class="p">,</span>
            <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Expand variables in the template file&quot;</span><span class="p">,</span>
     <span class="kr">expand_scalars</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">replace_or_add</span><span class="p">(</span><span class="nv">pattern</span><span class="p">,</span><span class="nv">line</span><span class="p">)</span>

 <span class="c"># Replace a pattern in a file with a single line.</span>
 <span class="c"># If the pattern is not found, add the line to the file.</span>
 <span class="c"># The pattern must match the whole line (it is automatically</span>
 <span class="c"># anchored to the start and end of the line) to avoid</span>
 <span class="c"># ambiguity.</span>

<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">cline</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">canonify</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(line)</span><span class="s">&quot;</span><span class="p">);</span>

<span class="kd">replace_patterns</span><span class="p">:</span>
  <span class="s">&quot;^(?!</span><span class="si">$(line)</span><span class="s">)</span><span class="si">$(pattern)</span><span class="s">$&quot;</span>
  <span class="kr">replace_with</span> <span class="o">=&gt;</span> <span class="nf">value</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(line)</span><span class="s">&quot;</span><span class="p">),</span>
  <span class="kr">classes</span> <span class="o">=&gt;</span> <span class="nf">always</span><span class="p">(</span><span class="s">&quot;replace_done_</span><span class="si">$(cline)</span><span class="s">&quot;</span><span class="p">);</span>

<span class="kd">insert_lines</span><span class="p">:</span>
  <span class="s">&quot;</span><span class="si">$(line)</span><span class="s">&quot;</span>
    <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;replace_done_</span><span class="si">$(cline)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">cronjob</span><span class="p">(</span><span class="nv">commands</span><span class="p">,</span><span class="nv">user</span><span class="p">,</span><span class="nv">hours</span><span class="p">,</span><span class="nv">mins</span><span class="p">)</span>

 <span class="c"># For adding lines to crontab for a user</span>
 <span class="c"># methods:</span>
 <span class="c">#  &quot;cron&quot; usebundle =&gt; cronjob(&quot;/bin/ls&quot;,&quot;mark&quot;,&quot;*&quot;,&quot;5,10&quot;);</span>

<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="nc">SuSE</span><span class="p">::</span>
   <span class="p">&quot;</span><span class="nv">crontab</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/var/spool/cron/tabs&quot;</span><span class="p">;</span>
  <span class="nc">redhat|fedora</span><span class="p">::</span>
   <span class="p">&quot;</span><span class="nv">crontab</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/var/spool/cron&quot;</span><span class="p">;</span>
 <span class="nc">!(SuSE|redhat|fedora)</span><span class="p">::</span>
    <span class="p">&quot;</span><span class="nv">crontab</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/var/spool/cron/crontabs&quot;</span><span class="p">;</span> 

<span class="kd">files</span><span class="p">:</span>

<span class="nc">!windows</span><span class="p">::</span>
  <span class="s">&quot;</span><span class="si">$(crontab)</span><span class="s">/</span><span class="si">$(user)</span><span class="s">&quot;</span> 

    <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;A user&#39;s regular batch jobs are added to this file&quot;</span><span class="p">,</span>
     <span class="kr">create</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">,</span>
  <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">append_if_no_line</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(mins)</span><span class="s"> </span><span class="si">$(hours)</span><span class="s"> * * * </span><span class="si">$(commands)</span><span class="s">&quot;</span><span class="p">),</span>
      <span class="kr">perms</span> <span class="o">=&gt;</span> <span class="nf">mo</span><span class="p">(</span><span class="s">&quot;644&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(user)</span><span class="s">&quot;</span><span class="p">),</span>
    <span class="kr">classes</span> <span class="o">=&gt;</span> <span class="nf">if_repaired</span><span class="p">(</span><span class="s">&quot;changed_crontab&quot;</span><span class="p">);</span>

<span class="kd">processes</span><span class="p">:</span>

<span class="nc">changed_crontab</span><span class="p">::</span>
   <span class="s">&quot;cron&quot;</span>
         <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Most crons need to be huped after file changes&quot;</span><span class="p">,</span>
         <span class="kr">signals</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;hup&quot;</span> <span class="p">};</span>

<span class="p">}</span>



<span class="c">##</span>
<span class="c">## editing bodies</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">edit_field</span> <span class="nf">quoted_var</span><span class="p">(</span><span class="nv">newval</span><span class="p">,</span><span class="nv">method</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">field_separator</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\&quot;</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">select_field</span>    <span class="o">=&gt;</span> <span class="s">&quot;2&quot;</span><span class="p">;</span>
<span class="kr">value_separator</span>  <span class="o">=&gt;</span> <span class="s">&quot; &quot;</span><span class="p">;</span>
<span class="kr">field_value</span>     <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(newval)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">field_operation</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(method)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">extend_fields</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
<span class="kr">allow_blank_fields</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">edit_field</span> <span class="nf">col</span><span class="p">(</span><span class="nv">split</span><span class="p">,</span><span class="nv">col</span><span class="p">,</span><span class="nv">newval</span><span class="p">,</span><span class="nv">method</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">field_separator</span>    <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(split)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">select_field</span>       <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(col)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">value_separator</span>    <span class="o">=&gt;</span> <span class="s">&quot;,&quot;</span><span class="p">;</span>
<span class="kr">field_value</span>        <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(newval)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">field_operation</span>    <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(method)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">extend_fields</span>      <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">allow_blank_fields</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">edit_field</span> <span class="nf">line</span><span class="p">(</span><span class="nv">split</span><span class="p">,</span><span class="nv">col</span><span class="p">,</span><span class="nv">newval</span><span class="p">,</span><span class="nv">method</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">field_separator</span>    <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(split)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">select_field</span>       <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(col)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">value_separator</span>    <span class="o">=&gt;</span> <span class="s">&quot; &quot;</span><span class="p">;</span>
<span class="kr">field_value</span>        <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(newval)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">field_operation</span>    <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(method)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">extend_fields</span>      <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">allow_blank_fields</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">replace_with</span> <span class="nf">value</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">replace_value</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">occurrences</span> <span class="o">=&gt;</span> <span class="s">&quot;all&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">select_region</span> <span class="nf">INI_section</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">select_start</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\[</span><span class="si">$(x)</span><span class="se">\]\s</span><span class="s">*&quot;</span><span class="p">;</span>
<span class="kr">select_end</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\[</span><span class="s">.*</span><span class="se">\]\s</span><span class="s">*&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## edit_defaults</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">edit_defaults</span> <span class="nf">std_defs</span>
<span class="p">{</span>
<span class="kr">empty_file_before_editing</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
<span class="kr">edit_backup</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
<span class="kr">max_file_size</span> <span class="o">=&gt;</span> <span class="s">&quot;300000&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">edit_defaults</span> <span class="nf">empty</span>
<span class="p">{</span>
<span class="kr">empty_file_before_editing</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">edit_backup</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
<span class="kr">max_file_size</span> <span class="o">=&gt;</span> <span class="s">&quot;300000&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">edit_defaults</span> <span class="nf">backup_timestamp</span>
<span class="p">{</span>
  <span class="kr">empty_file_before_editing</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
  <span class="kr">edit_backup</span> <span class="o">=&gt;</span> <span class="s">&quot;timestamp&quot;</span><span class="p">;</span>
  <span class="kr">max_file_size</span> <span class="o">=&gt;</span> <span class="s">&quot;300000&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">edit_defaults</span> <span class="nf">no_backup</span>
<span class="p">{</span>
<span class="kr">edit_backup</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## location</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">location</span> <span class="nf">start</span>
<span class="p">{</span>
<span class="kr">before_after</span> <span class="o">=&gt;</span> <span class="s">&quot;before&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">location</span> <span class="nf">after</span><span class="p">(</span><span class="nv">str</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">before_after</span> <span class="o">=&gt;</span> <span class="s">&quot;after&quot;</span><span class="p">;</span>
<span class="kr">select_line_matching</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(str)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## replace_with</span>
<span class="c">##</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">replace_with</span> <span class="nf">comment</span><span class="p">(</span><span class="nv">c</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">replace_value</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(c)</span><span class="s"> </span><span class="si">$(match.1)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">occurrences</span> <span class="o">=&gt;</span> <span class="s">&quot;all&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">replace_with</span> <span class="nf">uncomment</span>
<span class="p">{</span>
<span class="kr">replace_value</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(match.1)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">occurrences</span> <span class="o">=&gt;</span> <span class="s">&quot;all&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">####################################################</span>
<span class="c">## agent bodyparts</span>
<span class="c">####################################################</span>

<span class="c">##</span>
<span class="c">## action</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">if_elapsed</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">expireafter</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">measure_performance</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">measurement_class</span> <span class="o">=&gt;</span> <span class="s">&quot;Detect changes in </span><span class="si">$(this.promiser)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">expireafter</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">warn_only</span>
<span class="p">{</span>
<span class="kr">action_policy</span> <span class="o">=&gt;</span> <span class="s">&quot;warn&quot;</span><span class="p">;</span>
<span class="kr">ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;60&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">bg</span><span class="p">(</span><span class="nv">elapsed</span><span class="p">,</span><span class="nv">expire</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">ifelapsed</span>   <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(elapsed)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">expireafter</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(expire)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">background</span>  <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">ifwin_bg</span>
<span class="p">{</span>
<span class="nc">windows</span><span class="p">::</span>
<span class="kr">background</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">immediate</span>
<span class="p">{</span>
<span class="kr">ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;0&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">policy</span><span class="p">(</span><span class="nv">p</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">action_policy</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(p)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="c"># Log a message to log=[/file|stdout]</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">log_repaired</span><span class="p">(</span><span class="nv">log</span><span class="p">,</span><span class="nv">message</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">log_string</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(sys.date)</span><span class="s">, </span><span class="si">$(message)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">log_repaired</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(log)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">###</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">log_verbose</span>
<span class="p">{</span>
<span class="kr">log_level</span> <span class="o">=&gt;</span> <span class="s">&quot;verbose&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## contain</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">silent</span>
<span class="p">{</span>
<span class="kr">no_output</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">in_dir</span><span class="p">(</span><span class="nv">s</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">chdir</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(s)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">in_dir_shell</span><span class="p">(</span><span class="nv">s</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">chdir</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(s)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">useshell</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">silent_in_dir</span><span class="p">(</span><span class="nv">s</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">chdir</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(s)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">no_output</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">in_shell</span>
<span class="p">{</span>
<span class="kr">useshell</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">in_shell_bg</span>
<span class="p">{</span>
<span class="kr">useshell</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">background</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">in_shell_and_silent</span>
<span class="p">{</span>
<span class="kr">useshell</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">no_output</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">setuid</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">exec_owner</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">useshell</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">setuid_sh</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">exec_owner</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">useshell</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">setuidgid_sh</span><span class="p">(</span><span class="nv">owner</span><span class="p">,</span><span class="nv">group</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">exec_owner</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(owner)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">exec_group</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(group)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">useshell</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">jail</span><span class="p">(</span><span class="nv">owner</span><span class="p">,</span><span class="nv">root</span><span class="p">,</span><span class="nv">dir</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">exec_owner</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(owner)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">useshell</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">chdir</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(dir)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">chroot</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(root)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>


<span class="c">##</span>
<span class="c">## classes</span>
<span class="c">##</span>


<span class="k">body</span> <span class="k">classes</span> <span class="nf">if_repaired</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">promise_repaired</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">classes</span> <span class="nf">if_else</span><span class="p">(</span><span class="nv">yes</span><span class="p">,</span><span class="nv">no</span><span class="p">)</span>

<span class="p">{</span>
<span class="kr">promise_kept</span>     <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(yes)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">promise_repaired</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(yes)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">repair_failed</span>    <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(no)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">repair_denied</span>    <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(no)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">repair_timeout</span>   <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(no)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">classes</span> <span class="nf">cf2_if_else</span><span class="p">(</span><span class="nv">yes</span><span class="p">,</span><span class="nv">no</span><span class="p">)</span>

<span class="c"># meant to match cf2 semantics</span>

<span class="p">{</span>
<span class="kr">promise_repaired</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(yes)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">repair_failed</span>    <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(no)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">repair_denied</span>    <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(no)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">repair_timeout</span>   <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(no)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">classes</span> <span class="nf">if_notkept</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">repair_failed</span>   <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">repair_denied</span>   <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">repair_timeout</span>  <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">classes</span> <span class="nf">if_ok</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">promise_repaired</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">promise_kept</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">classes</span> <span class="nf">cmd_repair</span><span class="p">(</span><span class="nv">code</span><span class="p">,</span><span class="nv">cl</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">repaired_returncodes</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(code)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">promise_repaired</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(cl)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## Persistent classes</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">classes</span> <span class="nf">state_repaired</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">promise_repaired</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">persist_time</span> <span class="o">=&gt;</span> <span class="s">&quot;10&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">classes</span> <span class="nf">enumerate</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>

<span class="c">#</span>
<span class="c"># This is used by commercial editions to count </span>
<span class="c"># instances of jobs in a cluster</span>
<span class="c">#</span>

<span class="p">{</span>
<span class="kr">promise_repaired</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;mXC_</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">promise_kept</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;mXC_</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">persist_time</span> <span class="o">=&gt;</span> <span class="s">&quot;15&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">classes</span> <span class="nf">always</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>

<span class="c"># Define a class no matter what the outcome of the promise is</span>

<span class="p">{</span>
  <span class="kr">promise_repaired</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
  <span class="kr">promise_kept</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
  <span class="kr">repair_failed</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
  <span class="kr">repair_denied</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
  <span class="kr">repair_timeout</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">###################################################</span>
<span class="c"># agent bundles</span>
<span class="c">###################################################</span>


<span class="c">##..................................................</span>
<span class="c">## files promises</span>
<span class="c">##..................................................</span>

<span class="c">##</span>
<span class="c">## copy_from</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">secure_cp</span><span class="p">(</span><span class="nv">from</span><span class="p">,</span><span class="nv">server</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">servers</span>     <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(server)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">compare</span>     <span class="o">=&gt;</span> <span class="s">&quot;digest&quot;</span><span class="p">;</span>
<span class="kr">encrypt</span>     <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">verify</span>      <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">remote_cp</span><span class="p">(</span><span class="nv">from</span><span class="p">,</span><span class="nv">server</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">servers</span>     <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(server)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">compare</span>     <span class="o">=&gt;</span> <span class="s">&quot;mtime&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">remote_dcp</span><span class="p">(</span><span class="nv">from</span><span class="p">,</span><span class="nv">server</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">servers</span>     <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(server)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">compare</span>     <span class="o">=&gt;</span> <span class="s">&quot;digest&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">local_cp</span><span class="p">(</span><span class="nv">from</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">local_dcp</span><span class="p">(</span><span class="nv">from</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">compare</span>     <span class="o">=&gt;</span> <span class="s">&quot;digest&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">perms_cp</span><span class="p">(</span><span class="nv">from</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">preserve</span>    <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">backup_local_cp</span><span class="p">(</span><span class="nv">from</span><span class="p">)</span>
<span class="c"># Local copy, keeping a backup of old versions</span>
<span class="p">{</span>
  <span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
  <span class="kr">copy_backup</span> <span class="o">=&gt;</span> <span class="s">&quot;timestamp&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="c"># Copy only if the file does not already exist, i.e. seed the placement</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">seed_cp</span><span class="p">(</span><span class="nv">from</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">compare</span>     <span class="o">=&gt;</span> <span class="s">&quot;exists&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">sync_cp</span><span class="p">(</span><span class="nv">from</span><span class="p">,</span><span class="nv">server</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">servers</span>     <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(server)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">purge</span>       <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">preserve</span>    <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">type_check</span>  <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">no_backup_cp</span><span class="p">(</span><span class="nv">from</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">copy_backup</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">no_backup_dcp</span><span class="p">(</span><span class="nv">from</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">copy_backup</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
<span class="kr">compare</span>     <span class="o">=&gt;</span> <span class="s">&quot;digest&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">no_backup_rcp</span><span class="p">(</span><span class="nv">from</span><span class="p">,</span><span class="nv">server</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">servers</span>     <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(server)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">compare</span>     <span class="o">=&gt;</span> <span class="s">&quot;mtime&quot;</span><span class="p">;</span>
<span class="kr">copy_backup</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## link_from</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">link_from</span> <span class="nf">ln_s</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">link_type</span> <span class="o">=&gt;</span> <span class="s">&quot;symlink&quot;</span><span class="p">;</span>
<span class="kr">source</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">when_no_source</span> <span class="o">=&gt;</span> <span class="s">&quot;force&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">link_from</span> <span class="nf">linkchildren</span><span class="p">(</span><span class="nv">tofile</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">source</span>        <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(tofile)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">link_type</span>     <span class="o">=&gt;</span> <span class="s">&quot;symlink&quot;</span><span class="p">;</span>
<span class="kr">when_no_source</span>  <span class="o">=&gt;</span> <span class="s">&quot;force&quot;</span><span class="p">;</span>
<span class="kr">link_children</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">when_linking_children</span> <span class="o">=&gt;</span> <span class="s">&quot;if_no_such_file&quot;</span><span class="p">;</span> <span class="c"># &quot;override_file&quot;;</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## perms</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">perms</span> <span class="nf">m</span><span class="p">(</span><span class="nv">mode</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">mode</span>   <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(mode)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">perms</span> <span class="nf">mo</span><span class="p">(</span><span class="nv">mode</span><span class="p">,</span><span class="nv">user</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">owners</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(user)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">mode</span>   <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(mode)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">perms</span> <span class="nf">mog</span><span class="p">(</span><span class="nv">mode</span><span class="p">,</span><span class="nv">user</span><span class="p">,</span><span class="nv">group</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">owners</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(user)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">groups</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(group)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">mode</span>   <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(mode)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">perms</span> <span class="nf">og</span><span class="p">(</span><span class="nv">u</span><span class="p">,</span><span class="nv">g</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">owners</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(u)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">groups</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(g)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">perms</span> <span class="nf">owner</span><span class="p">(</span><span class="nv">user</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">owners</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(user)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## ACLS (extended Unix perms)</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">acl</span> <span class="nf">access_generic</span><span class="p">(</span><span class="nv">acl</span><span class="p">)</span>
<span class="c"># default/inherited ACLs are left unchanged,</span>
<span class="c"># applicable for both files and directories on all platforms</span>
<span class="p">{</span>
<span class="kr">acl_method</span> <span class="o">=&gt;</span> <span class="s">&quot;overwrite&quot;</span><span class="p">;</span>
<span class="kr">aces</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;@(acl)&quot;</span> <span class="p">};</span>

<span class="nc">windows</span><span class="p">::</span>
<span class="kr">acl_type</span> <span class="o">=&gt;</span> <span class="s">&quot;ntfs&quot;</span><span class="p">;</span>

<span class="nc">!windows</span><span class="p">::</span>
<span class="kr">acl_type</span> <span class="o">=&gt;</span> <span class="s">&quot;posix&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">acl</span> <span class="nf">ntfs</span><span class="p">(</span><span class="nv">acl</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">acl_type</span> <span class="o">=&gt;</span> <span class="s">&quot;ntfs&quot;</span><span class="p">;</span>
<span class="kr">acl_method</span> <span class="o">=&gt;</span> <span class="s">&quot;overwrite&quot;</span><span class="p">;</span>
<span class="kr">aces</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;@(acl)&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">acl</span> <span class="nf">strict</span>
<span class="c"># NOTE: May need to take ownership of file/dir</span>
<span class="c"># to be sure no-one else is allowed access</span>
<span class="p">{</span>
<span class="kr">acl_method</span> <span class="o">=&gt;</span> <span class="s">&quot;overwrite&quot;</span><span class="p">;</span>

<span class="nc">windows</span><span class="p">::</span>
<span class="kr">aces</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;user:Administrator:rwx&quot;</span> <span class="p">};</span>
<span class="nc">!windows</span><span class="p">::</span>
<span class="kr">aces</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;user:root:rwx&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## depth_search</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">depth_search</span> <span class="nf">recurse</span><span class="p">(</span><span class="nv">d</span><span class="p">)</span>

<span class="p">{</span>
<span class="kr">depth</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(d)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">xdev</span>  <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">depth_search</span> <span class="nf">recurse_ignore</span><span class="p">(</span><span class="nv">d</span><span class="p">,</span><span class="nv">list</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">depth</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(d)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">exclude_dirs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="nv">@(list)</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">depth_search</span> <span class="nf">include_base</span>
<span class="p">{</span>
<span class="kr">include_basedir</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## delete</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">delete</span> <span class="nf">tidy</span>

<span class="p">{</span>
<span class="kr">dirlinks</span> <span class="o">=&gt;</span> <span class="s">&quot;delete&quot;</span><span class="p">;</span>
<span class="kr">rmdirs</span>   <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## rename</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">rename</span> <span class="nf">disable</span>
<span class="p">{</span>
<span class="kr">disable</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">rename</span> <span class="nf">rotate</span><span class="p">(</span><span class="nv">level</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">rotate</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(level)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">rename</span> <span class="nf">to</span><span class="p">(</span><span class="nv">file</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">newname</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(file)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## file_select</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">file_select</span> <span class="nf">name_age</span><span class="p">(</span><span class="nv">name</span><span class="p">,</span><span class="nv">days</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">leaf_name</span>   <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="kr">mtime</span>       <span class="o">=&gt;</span> <span class="nf">irange</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="nf">ago</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(days)</span><span class="s">&quot;</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">));</span>  
<span class="kr">file_result</span> <span class="o">=&gt;</span> <span class="s">&quot;mtime.leaf_name&quot;</span><span class="p">;</span> 
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">file_select</span> <span class="nf">days_old</span><span class="p">(</span><span class="nv">days</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">mtime</span>       <span class="o">=&gt;</span> <span class="nf">irange</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="nf">ago</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(days)</span><span class="s">&quot;</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">));</span>
<span class="kr">file_result</span> <span class="o">=&gt;</span> <span class="s">&quot;mtime&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">file_select</span> <span class="nf">size_range</span><span class="p">(</span><span class="nv">from</span><span class="p">,</span><span class="nv">to</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">search_size</span> <span class="o">=&gt;</span> <span class="nf">irange</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(to)</span><span class="s">&quot;</span><span class="p">);</span>
<span class="kr">file_result</span> <span class="o">=&gt;</span> <span class="s">&quot;size&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">file_select</span> <span class="nf">exclude</span><span class="p">(</span><span class="nv">name</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">leaf_name</span>  <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">&quot;</span><span class="p">};</span>
<span class="kr">file_result</span> <span class="o">=&gt;</span> <span class="s">&quot;!leaf_name&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">file_select</span> <span class="nf">plain</span>
<span class="p">{</span>
<span class="kr">file_types</span>  <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;plain&quot;</span> <span class="p">};</span>
<span class="kr">file_result</span> <span class="o">=&gt;</span> <span class="s">&quot;file_types&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">body</span> <span class="k">file_select</span> <span class="nf">dirs</span>
<span class="p">{</span>
<span class="kr">file_types</span>  <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;dir&quot;</span> <span class="p">};</span>
<span class="kr">file_result</span> <span class="o">=&gt;</span> <span class="s">&quot;file_types&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">file_select</span> <span class="nf">by_name</span><span class="p">(</span><span class="nv">names</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">leaf_name</span>  <span class="o">=&gt;</span> <span class="p">{</span> <span class="nv">@(names)</span><span class="p">};</span>
<span class="kr">file_result</span> <span class="o">=&gt;</span> <span class="s">&quot;leaf_name&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">file_select</span> <span class="nf">ex_list</span><span class="p">(</span><span class="nv">names</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">leaf_name</span>  <span class="o">=&gt;</span> <span class="p">{</span> <span class="nv">@(names)</span><span class="p">};</span>
<span class="kr">file_result</span> <span class="o">=&gt;</span> <span class="s">&quot;!leaf_name&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## changes</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">changes</span> <span class="nf">detect_all_change</span>

<span class="c"># This is fierce, and will cost disk cycles</span>

<span class="p">{</span>
<span class="kr">hash</span>           <span class="o">=&gt;</span> <span class="s">&quot;best&quot;</span><span class="p">;</span>
<span class="kr">report_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;all&quot;</span><span class="p">;</span>
<span class="kr">update_hashes</span>  <span class="o">=&gt;</span> <span class="s">&quot;yes&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">changes</span> <span class="nf">detect_content</span>

<span class="c"># This is a cheaper alternative</span>

<span class="p">{</span>
<span class="kr">hash</span>           <span class="o">=&gt;</span> <span class="s">&quot;md5&quot;</span><span class="p">;</span>
<span class="kr">report_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;content&quot;</span><span class="p">;</span>
<span class="kr">update_hashes</span>  <span class="o">=&gt;</span> <span class="s">&quot;yes&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">changes</span> <span class="nf">noupdate</span>
<span class="c"># Use on (small) files that should never change</span>
<span class="p">{</span>
<span class="kr">hash</span>           <span class="o">=&gt;</span> <span class="s">&quot;sha256&quot;</span><span class="p">;</span>
<span class="kr">report_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;content&quot;</span><span class="p">;</span>
<span class="kr">update_hashes</span>  <span class="o">=&gt;</span> <span class="s">&quot;no&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">changes</span> <span class="nf">diff</span>
<span class="c"># Generates diff report (Nova and above)</span>
<span class="p">{</span>
<span class="kr">hash</span>           <span class="o">=&gt;</span> <span class="s">&quot;sha256&quot;</span><span class="p">;</span>
<span class="kr">report_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;content&quot;</span><span class="p">;</span>
<span class="kr">report_diffs</span>   <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">update_hashes</span>  <span class="o">=&gt;</span> <span class="s">&quot;yes&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">changes</span> <span class="nf">diff_noupdate</span>
<span class="p">{</span>
<span class="kr">hash</span>           <span class="o">=&gt;</span> <span class="s">&quot;sha256&quot;</span><span class="p">;</span>
<span class="kr">report_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;content&quot;</span><span class="p">;</span>
<span class="kr">report_diffs</span>   <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">update_hashes</span>  <span class="o">=&gt;</span> <span class="s">&quot;no&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##--------------------------------------------------------------</span>
<span class="c">## Packages promises</span>
<span class="c">##--------------------------------------------------------------</span>

<span class="k">body</span> <span class="k">package_method</span> <span class="nf">zypper</span>

<span class="p">{</span>
<span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;bulk&quot;</span><span class="p">;</span>

<span class="kr">package_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/rpm -qa --queryformat </span><span class="se">\&quot;</span><span class="s">i | repos | %{name} | %{version}-%{release} | %{arch}</span><span class="se">\n\&quot;</span><span class="s">&quot;</span><span class="p">;</span>

<span class="c"># set it to &quot;0&quot; to avoid caching of list during upgrade</span>
<span class="kr">package_list_update_ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;240&quot;</span><span class="p">;</span>

<span class="kr">package_patch_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper patches&quot;</span><span class="p">;</span>
<span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;i.*&quot;</span><span class="p">;</span>
<span class="kr">package_list_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_list_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_list_arch_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>

<span class="kr">package_patch_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*Installed.*|.*Not Applicable.*&quot;</span><span class="p">;</span>
<span class="kr">package_patch_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_patch_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>

<span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper --non-interactive install&quot;</span><span class="p">;</span>
<span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper --non-interactive remove --force-resolution&quot;</span><span class="p">;</span>
<span class="kr">package_update_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper --non-interactive update&quot;</span><span class="p">;</span>

<span class="kr">package_patch_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper --non-interactive patch$&quot;</span><span class="p">;</span> <span class="c"># $ means no args</span>
<span class="kr">package_verify_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper --non-interactive verify$&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">package_method</span> <span class="nf">apt</span>
<span class="p">{</span>
<span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;bulk&quot;</span><span class="p">;</span>
<span class="kr">package_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/dpkg -l&quot;</span><span class="p">;</span> 
<span class="kr">package_list_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;ii</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span> 
<span class="kr">package_list_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;ii</span><span class="se">\s</span><span class="s">+[^</span><span class="se">\s</span><span class="s">]+</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*&quot;</span><span class="p">;</span> <span class="c"># all reported are installed</span>
<span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">&quot;</span><span class="p">;</span> 

<span class="c"># set it to &quot;0&quot; to avoid caching of list during upgrade</span>
<span class="kr">package_list_update_ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;240&quot;</span><span class="p">;</span>

<span class="nc">have_aptitude</span><span class="p">::</span> 
   <span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C /usr/bin/aptitude -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --assume-yes install&quot;</span><span class="p">;</span>
   <span class="kr">package_list_update_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/aptitude update&quot;</span><span class="p">;</span>
   <span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C /usr/bin/aptitude -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --assume-yes -q remove&quot;</span><span class="p">;</span>
   <span class="kr">package_update_command</span> <span class="o">=&gt;</span>  <span class="s">&quot;/usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C /usr/bin/aptitude -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --assume-yes install&quot;</span><span class="p">;</span>
   <span class="kr">package_verify_command</span> <span class="o">=&gt;</span>  <span class="s">&quot;/usr/bin/aptitude show&quot;</span><span class="p">;</span>
   <span class="kr">package_noverify_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;(State: not installed|E: Unable to locate package .*)&quot;</span><span class="p">;</span>

<span class="nc">!have_aptitude</span><span class="p">::</span>
   <span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C /usr/bin/apt-get -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --yes install&quot;</span><span class="p">;</span>
   <span class="kr">package_list_update_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/apt-get update&quot;</span><span class="p">;</span>
   <span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C /usr/bin/apt-get -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --yes -q remove&quot;</span><span class="p">;</span>
   <span class="kr">package_update_command</span> <span class="o">=&gt;</span>  <span class="s">&quot;/usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C /usr/bin/apt-get -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --yes install&quot;</span><span class="p">;</span>
   <span class="kr">package_verify_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/dpkg -s&quot;</span><span class="p">;</span>
   <span class="kr">package_noverify_returncode</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">package_method</span> <span class="nf">dpkg_version</span><span class="p">(</span><span class="nv">repo</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;individual&quot;</span><span class="p">;</span>
<span class="kr">package_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/dpkg -l&quot;</span><span class="p">;</span>

<span class="c"># set it to &quot;0&quot; to avoid caching of list during upgrade</span>
<span class="kr">package_list_update_ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;240&quot;</span><span class="p">;</span>

<span class="kr">package_list_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;ii</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_list_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;ii</span><span class="se">\s</span><span class="s">+[^</span><span class="se">\s</span><span class="s">]+</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>

<span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*&quot;</span><span class="p">;</span> <span class="c"># all reported are installed</span>

<span class="kr">package_file_repositories</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(repo)</span><span class="s">&quot;</span> <span class="p">};</span>

<span class="nc">debian.x86_64</span><span class="p">::</span>
   <span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">_</span><span class="si">$(version)</span><span class="s">_amd64.deb&quot;</span><span class="p">;</span>

<span class="nc">debian.i686</span><span class="p">::</span>
   <span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">_</span><span class="si">$(version)</span><span class="s">_i386.deb&quot;</span><span class="p">;</span>

<span class="nc">debian</span><span class="p">::</span>
   <span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/dpkg --install&quot;</span><span class="p">;</span>
   <span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/dpkg --purge&quot;</span><span class="p">;</span>
   <span class="kr">package_update_command</span> <span class="o">=&gt;</span>  <span class="s">&quot;/usr/bin/dpkg --install&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">package_method</span> <span class="nf">rpm_version</span><span class="p">(</span><span class="nv">repo</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;individual&quot;</span><span class="p">;</span>

<span class="kr">package_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/rpm -qa --queryformat </span><span class="se">\&quot;</span><span class="s">i | repos | %{name} | %{version}-%{release} | %{arch}</span><span class="se">\n\&quot;</span><span class="s">&quot;</span><span class="p">;</span>

<span class="c"># set it to &quot;0&quot; to avoid caching of list during upgrade</span>
<span class="kr">package_list_update_ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;240&quot;</span><span class="p">;</span>

<span class="kr">package_list_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">|]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_list_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">|]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_list_arch_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>

<span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;i.*&quot;</span><span class="p">;</span>

<span class="kr">package_file_repositories</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(repo)</span><span class="s">&quot;</span> <span class="p">};</span>

<span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">-</span><span class="si">$(version)</span><span class="s">.</span><span class="si">$(arch)</span><span class="s">.rpm&quot;</span><span class="p">;</span>

<span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/rpm -ivh &quot;</span><span class="p">;</span>
<span class="kr">package_update_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/rpm -Uvh &quot;</span><span class="p">;</span>
<span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/rpm -e --nodeps&quot;</span><span class="p">;</span>
<span class="kr">package_noverify_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*[^</span><span class="se">\s</span><span class="s">].*&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">package_method</span> <span class="nf">msi_implicit</span><span class="p">(</span><span class="nv">repo</span><span class="p">)</span>
<span class="c"># Use whole file name as promiser, e.g. &quot;7-Zip-4.50-x86_64.msi&quot;,</span>
<span class="c"># the name, version and arch is then deduced from the promiser</span>
<span class="p">{</span>
<span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;individual&quot;</span><span class="p">;</span>
<span class="kr">package_file_repositories</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(repo)</span><span class="s">&quot;</span> <span class="p">};</span>

<span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*&quot;</span><span class="p">;</span>
 
<span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">-</span><span class="si">$(version)</span><span class="s">-</span><span class="si">$(arch)</span><span class="s">.msi&quot;</span><span class="p">;</span>
<span class="kr">package_delete_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(firstrepo)$(name)</span><span class="s">-</span><span class="si">$(version)</span><span class="s">-</span><span class="si">$(arch)</span><span class="s">.msi&quot;</span><span class="p">;</span>

<span class="kr">package_name_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;^(</span><span class="se">\S</span><span class="s">+)-(</span><span class="se">\d</span><span class="s">+</span><span class="se">\.</span><span class="s">?)+&quot;</span><span class="p">;</span>
<span class="kr">package_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;^</span><span class="se">\S</span><span class="s">+-((</span><span class="se">\d</span><span class="s">+</span><span class="se">\.</span><span class="s">?)+)&quot;</span><span class="p">;</span>
<span class="kr">package_arch_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;^</span><span class="se">\S</span><span class="s">+-[</span><span class="se">\d\.</span><span class="s">]+-(.*).msi&quot;</span><span class="p">;</span>

<span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\&quot;</span><span class="si">$(sys.winsysdir)</span><span class="se">\m</span><span class="s">siexec.exe</span><span class="se">\&quot;</span><span class="s"> /qn /i&quot;</span><span class="p">;</span>
<span class="kr">package_update_command</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\&quot;</span><span class="si">$(sys.winsysdir)</span><span class="se">\m</span><span class="s">siexec.exe</span><span class="se">\&quot;</span><span class="s"> /qn /i&quot;</span><span class="p">;</span>
<span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\&quot;</span><span class="si">$(sys.winsysdir)</span><span class="se">\m</span><span class="s">siexec.exe</span><span class="se">\&quot;</span><span class="s"> /qn /x&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">package_method</span> <span class="nf">msi_explicit</span><span class="p">(</span><span class="nv">repo</span><span class="p">)</span>
<span class="c"># use software name as promiser, e.g. &quot;7-Zip&quot;, and explicitly</span>
<span class="c"># specify any package_version and package_arch</span>
<span class="p">{</span>
<span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;individual&quot;</span><span class="p">;</span>
<span class="kr">package_file_repositories</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(repo)</span><span class="s">&quot;</span> <span class="p">};</span>

<span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*&quot;</span><span class="p">;</span>
 
<span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">-</span><span class="si">$(version)</span><span class="s">-</span><span class="si">$(arch)</span><span class="s">.msi&quot;</span><span class="p">;</span>
<span class="kr">package_delete_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(firstrepo)$(name)</span><span class="s">-</span><span class="si">$(version)</span><span class="s">-</span><span class="si">$(arch)</span><span class="s">.msi&quot;</span><span class="p">;</span>

<span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\&quot;</span><span class="si">$(sys.winsysdir)</span><span class="se">\m</span><span class="s">siexec.exe</span><span class="se">\&quot;</span><span class="s"> /qn /i&quot;</span><span class="p">;</span>
<span class="kr">package_update_command</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\&quot;</span><span class="si">$(sys.winsysdir)</span><span class="se">\m</span><span class="s">siexec.exe</span><span class="se">\&quot;</span><span class="s"> /qn /i&quot;</span><span class="p">;</span>
<span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\&quot;</span><span class="si">$(sys.winsysdir)</span><span class="se">\m</span><span class="s">siexec.exe</span><span class="se">\&quot;</span><span class="s"> /qn /x&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">package_method</span> <span class="nf">yum</span>
<span class="p">{</span>
<span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;bulk&quot;</span><span class="p">;</span>
<span class="kr">package_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/yum list installed&quot;</span><span class="p">;</span>
<span class="kr">package_patch_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/yum check-update&quot;</span><span class="p">;</span>

<span class="c"># Remember to escape special characters like |</span>

<span class="kr">package_list_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;([^.]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_list_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^</span><span class="se">\s</span><span class="s">]</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_list_arch_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^.]+</span><span class="se">\.</span><span class="s">([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>

<span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*(installed|</span><span class="se">\s</span><span class="s">+@).*&quot;</span><span class="p">;</span>
<span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">.</span><span class="si">$(arch)</span><span class="s">&quot;</span><span class="p">;</span>

<span class="c"># set it to &quot;0&quot; to avoid caching of list during upgrade</span>
<span class="kr">package_list_update_ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;240&quot;</span><span class="p">;</span>

<span class="kr">package_patch_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;^</span><span class="se">\s</span><span class="s">.*&quot;</span><span class="p">;</span>
<span class="kr">package_patch_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;([^.]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_patch_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^</span><span class="se">\s</span><span class="s">]</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_patch_arch_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^.]+</span><span class="se">\.</span><span class="s">([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>

<span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/yum -y install&quot;</span><span class="p">;</span>
<span class="kr">package_update_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/yum -y update&quot;</span><span class="p">;</span>
<span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/rpm -e --nodeps&quot;</span><span class="p">;</span>
<span class="kr">package_verify_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/rpm -V&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">package_method</span> <span class="nf">yum_rpm</span>
<span class="c"># Contributed by Trond Hasle Amundsen</span>

<span class="c"># More efficient package method for RedHat - uses rpm to list instead of yum</span>
<span class="c"># Notes:</span>
<span class="c"># - using $(name).$(arch) instead of $(name) for package_name_convention</span>
<span class="c">#   causes uninstallation to fail.</span>
<span class="c"># - using allmatches to remove for all architectures</span>
<span class="c">#</span>
<span class="p">{</span>
  <span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;bulk&quot;</span><span class="p">;</span>
  <span class="kr">package_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/rpm -qa --qf &#39;%{name} %{version}-%{release} %{arch}</span><span class="se">\n</span><span class="s">&#39;&quot;</span><span class="p">;</span>
  <span class="kr">package_patch_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/yum check-update&quot;</span><span class="p">;</span>

  <span class="kr">package_list_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;^(</span><span class="se">\S</span><span class="s">+?)</span><span class="se">\s\S</span><span class="s">+?</span><span class="se">\s\S</span><span class="s">+$&quot;</span><span class="p">;</span>
  <span class="kr">package_list_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;^</span><span class="se">\S</span><span class="s">+?</span><span class="se">\s</span><span class="s">(</span><span class="se">\S</span><span class="s">+?)</span><span class="se">\s\S</span><span class="s">+$&quot;</span><span class="p">;</span>
  <span class="kr">package_list_arch_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;^</span><span class="se">\S</span><span class="s">+?</span><span class="se">\s\S</span><span class="s">+?</span><span class="se">\s</span><span class="s">(</span><span class="se">\S</span><span class="s">+)$&quot;</span><span class="p">;</span>

  <span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*&quot;</span><span class="p">;</span>
  <span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">&quot;</span><span class="p">;</span>

  <span class="kr">package_patch_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;^</span><span class="se">\s</span><span class="s">.*&quot;</span><span class="p">;</span>
  <span class="kr">package_patch_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;([^.]+).*&quot;</span><span class="p">;</span>
  <span class="kr">package_patch_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^</span><span class="se">\s</span><span class="s">]</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
  <span class="kr">package_patch_arch_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^.]+</span><span class="se">\.</span><span class="s">([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>

  <span class="kr">package_add_command</span>    <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/yum -y install&quot;</span><span class="p">;</span>
  <span class="kr">package_update_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/yum -y update&quot;</span><span class="p">;</span>
  <span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/rpm -e --nodeps --allmatches&quot;</span><span class="p">;</span>
  <span class="kr">package_verify_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/rpm -V&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="c"># The solaris package system is poorly designed, with too many different</span>
<span class="c"># names to track. See the example in tests/units/unit_package_solaris.cf</span>
<span class="c"># to see how to use this</span>

<span class="k">body</span> <span class="k">package_method</span> <span class="nf">solaris</span> <span class="p">(</span><span class="nf">pkgname</span><span class="p">,</span> <span class="nf">spoolfile</span><span class="p">,</span> <span class="nf">adminfile</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;individual&quot;</span><span class="p">;</span>
<span class="kr">package_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/pkginfo -l&quot;</span><span class="p">;</span>
<span class="kr">package_multiline_start</span>    <span class="o">=&gt;</span>  <span class="s">&quot;</span><span class="se">\s</span><span class="s">*PKGINST:</span><span class="se">\s</span><span class="s">+[^</span><span class="se">\s</span><span class="s">]+.*&quot;</span><span class="p">;</span>
<span class="kr">package_list_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\s</span><span class="s">*PKGINST:</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_list_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\s</span><span class="s">*VERSION:</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
<span class="kr">package_list_arch_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\s</span><span class="s">*ARCH:</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+)&quot;</span><span class="p">;</span>
<span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="se">\s</span><span class="s">*STATUS:</span><span class="se">\s</span><span class="s">*(completely|partially)</span><span class="se">\s</span><span class="s">+installed.*&quot;</span><span class="p">;</span>
<span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/sbin/pkgadd -n -a /tmp/</span><span class="si">$(adminfile)</span><span class="s"> -d /tmp/</span><span class="si">$(spoolfile)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/sbin/pkgrm -n -a /tmp/</span><span class="si">$(adminfile)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="c">#</span>
<span class="c"># The following bundle is part of a package setup for solaris, see unit examples</span>
<span class="c">#</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">create_solaris_admin_file</span>
<span class="p">{</span>
<span class="kd">insert_lines</span><span class="p">:</span>
		
  <span class="s">&quot;mail=</span>
<span class="s">instance=unique</span>
<span class="s">partial=nocheck</span>
<span class="s">runlevel=nocheck</span>
<span class="s">idepend=nocheck</span>
<span class="s">rdepend=nocheck</span>
<span class="s">space=nocheck</span>
<span class="s">setuid=nocheck</span>
<span class="s">conflict=nocheck</span>
<span class="s">action=nocheck</span>
<span class="s">networktimeout=60</span>
<span class="s">networkretries=3</span>
<span class="s">authentication=quit</span>
<span class="s">keystore=/var/sadm/security</span>
<span class="s">proxy=</span>
<span class="s">basedir=default&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">package_method</span> <span class="nf">freebsd</span>
<span class="p">{</span>
 <span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;individual&quot;</span><span class="p">;</span>

 <span class="c"># Could use rpm for this</span>
 <span class="kr">package_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/sbin/pkg_info&quot;</span><span class="p">;</span>

 <span class="c"># Remember to escape special characters like |</span>

 <span class="kr">package_list_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;([^</span><span class="se">\s</span><span class="s">]+)-.*&quot;</span><span class="p">;</span>
 <span class="kr">package_list_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^</span><span class="se">\s</span><span class="s">]+-([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>

 <span class="kr">package_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;([^</span><span class="se">\s</span><span class="s">]+)-.*&quot;</span><span class="p">;</span>
 <span class="kr">package_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^</span><span class="se">\s</span><span class="s">]+-([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>

 <span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*&quot;</span><span class="p">;</span>

 <span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">-</span><span class="si">$(version)</span><span class="s">&quot;</span><span class="p">;</span>


<span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/sbin/pkg_add -r&quot;</span><span class="p">;</span>
<span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/sbin/pkg_delete&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

 <span class="c"># Single bundle for all the similar managers simplifies promises</span>

<span class="k">body</span> <span class="k">package_method</span> <span class="nf">generic</span>
<span class="p">{</span>
<span class="nc">SuSE</span><span class="p">::</span>
 <span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;bulk&quot;</span><span class="p">;</span>
 <span class="kr">package_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper packages&quot;</span><span class="p">;</span>
 <span class="kr">package_patch_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper patches&quot;</span><span class="p">;</span>
 <span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;i.*&quot;</span><span class="p">;</span>
 <span class="kr">package_list_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_list_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_list_arch_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_patch_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*Installed.*|.*Not Applicable.*&quot;</span><span class="p">;</span>
 <span class="kr">package_patch_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_patch_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^|]+</span><span class="se">\|</span><span class="s">[^|]+</span><span class="se">\|\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">&quot;</span><span class="p">;</span>
 <span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper --non-interactive install&quot;</span><span class="p">;</span>
 <span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper --non-interactive remove --force-resolution&quot;</span><span class="p">;</span>
 <span class="kr">package_update_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper --non-interactive update&quot;</span><span class="p">;</span>
 <span class="kr">package_patch_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper --non-interactive patch$&quot;</span><span class="p">;</span> <span class="c"># $ means no args</span>
 <span class="kr">package_verify_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/zypper --non-interactive verify$&quot;</span><span class="p">;</span>

<span class="nc">redhat</span><span class="p">::</span>
 <span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;bulk&quot;</span><span class="p">;</span>
 <span class="kr">package_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/yum list installed&quot;</span><span class="p">;</span>
 <span class="kr">package_patch_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/yum check-update&quot;</span><span class="p">;</span>
 <span class="kr">package_list_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;([^.]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_list_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^</span><span class="se">\s</span><span class="s">]</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_list_arch_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^.]+</span><span class="se">\.</span><span class="s">([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*(installed|</span><span class="se">\s</span><span class="s">+@).*&quot;</span><span class="p">;</span>
 <span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">.</span><span class="si">$(arch)</span><span class="s">&quot;</span><span class="p">;</span>
 <span class="kr">package_list_update_ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;240&quot;</span><span class="p">;</span>
 <span class="kr">package_patch_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;^</span><span class="se">\s</span><span class="s">.*&quot;</span><span class="p">;</span>
 <span class="kr">package_patch_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;([^.]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_patch_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^</span><span class="se">\s</span><span class="s">]</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_patch_arch_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;[^.]+</span><span class="se">\.</span><span class="s">([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/yum -y install&quot;</span><span class="p">;</span>
 <span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/rpm -e --nodeps&quot;</span><span class="p">;</span>
 <span class="kr">package_verify_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/bin/rpm -V&quot;</span><span class="p">;</span>

<span class="nc">debian</span><span class="p">::</span>
 <span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;bulk&quot;</span><span class="p">;</span>
 <span class="kr">package_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/dpkg -l&quot;</span><span class="p">;</span>
 <span class="kr">package_list_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;ii</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_list_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;ii</span><span class="se">\s</span><span class="s">+[^</span><span class="se">\s</span><span class="s">]+</span><span class="se">\s</span><span class="s">+([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*&quot;</span><span class="p">;</span> <span class="c"># all reported are installed</span>
 <span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">&quot;</span><span class="p">;</span>
 <span class="kr">package_list_update_ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;240&quot;</span><span class="p">;</span>		<span class="c"># 4 hours</span>

<span class="nc">debian.have_aptitude</span><span class="p">::</span>
   <span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C /usr/bin/aptitude -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --assume-yes install&quot;</span><span class="p">;</span>
   <span class="kr">package_list_update_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/aptitude update&quot;</span><span class="p">;</span>
   <span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C /usr/bin/aptitude -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --assume-yes remove&quot;</span><span class="p">;</span>
   <span class="kr">package_update_command</span> <span class="o">=&gt;</span>  <span class="s">&quot;/usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C /usr/bin/aptitude -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --assume-yes install&quot;</span><span class="p">;</span>
   <span class="kr">package_verify_command</span> <span class="o">=&gt;</span>  <span class="s">&quot;/usr/bin/aptitude show&quot;</span><span class="p">;</span>
   <span class="kr">package_noverify_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;(State: not installed|E: Unable to locate package .*)&quot;</span><span class="p">;</span>

<span class="nc">debian.!have_aptitude</span><span class="p">::</span>
   <span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C /usr/bin/apt-get -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --yes install&quot;</span><span class="p">;</span>
   <span class="kr">package_list_update_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/apt-get update&quot;</span><span class="p">;</span>
   <span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C /usr/bin/apt-get -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --yes remove&quot;</span><span class="p">;</span>
   <span class="kr">package_update_command</span> <span class="o">=&gt;</span>  <span class="s">&quot;/usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C /usr/bin/apt-get -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --yes install&quot;</span><span class="p">;</span>
   <span class="kr">package_verify_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/bin/dpkg -s&quot;</span><span class="p">;</span>
   <span class="kr">package_noverify_returncode</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>

<span class="nc">freebsd</span><span class="p">::</span>
 <span class="kr">package_changes</span> <span class="o">=&gt;</span> <span class="s">&quot;individual&quot;</span><span class="p">;</span>
 <span class="kr">package_list_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/sbin/pkg_info&quot;</span><span class="p">;</span>
 <span class="kr">package_list_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;([^</span><span class="se">\s</span><span class="s">]+)-.*&quot;</span><span class="p">;</span>
 <span class="kr">package_list_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^</span><span class="se">\s</span><span class="s">]+-([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_name_regex</span>    <span class="o">=&gt;</span> <span class="s">&quot;([^</span><span class="se">\s</span><span class="s">]+)-.*&quot;</span><span class="p">;</span>
 <span class="kr">package_version_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;[^</span><span class="se">\s</span><span class="s">]+-([^</span><span class="se">\s</span><span class="s">]+).*&quot;</span><span class="p">;</span>
 <span class="kr">package_installed_regex</span> <span class="o">=&gt;</span> <span class="s">&quot;.*&quot;</span><span class="p">;</span>
 <span class="kr">package_name_convention</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">-</span><span class="si">$(version)</span><span class="s">&quot;</span><span class="p">;</span>
 <span class="kr">package_add_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/sbin/pkg_add -r&quot;</span><span class="p">;</span>
 <span class="kr">package_delete_command</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/sbin/pkg_delete&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##-------------------------------------------------------</span>
<span class="c">## storage promises</span>
<span class="c">##-------------------------------------------------------</span>

<span class="k">body</span> <span class="k">volume</span> <span class="nf">min_free_space</span><span class="p">(</span><span class="nv">free</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">check_foreign</span>  <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
<span class="kr">freespace</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(free)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">sensible_size</span>  <span class="o">=&gt;</span> <span class="s">&quot;10000&quot;</span><span class="p">;</span>
<span class="kr">sensible_count</span> <span class="o">=&gt;</span> <span class="s">&quot;2&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">mount</span> <span class="nf">nfs</span><span class="p">(</span><span class="nv">server</span><span class="p">,</span><span class="nv">source</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">mount_type</span> <span class="o">=&gt;</span> <span class="s">&quot;nfs&quot;</span><span class="p">;</span>
<span class="kr">mount_source</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(source)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">mount_server</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(server)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">edit_fstab</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>


<span class="c">##</span>

<span class="k">body</span> <span class="k">mount</span> <span class="nf">nfs_p</span><span class="p">(</span><span class="nv">server</span><span class="p">,</span><span class="nv">source</span><span class="p">,</span><span class="nv">perm</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">mount_type</span> <span class="o">=&gt;</span> <span class="s">&quot;nfs&quot;</span><span class="p">;</span>
<span class="kr">mount_source</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(source)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">mount_server</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(server)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">mount_options</span> <span class="o">=&gt;</span> <span class="p">{</span><span class="s">&quot;</span><span class="si">$(perm)</span><span class="s">&quot;</span><span class="p">};</span>
<span class="kr">edit_fstab</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">mount</span> <span class="nf">unmount</span>
<span class="p">{</span>
<span class="kr">mount_type</span> <span class="o">=&gt;</span> <span class="s">&quot;nfs&quot;</span><span class="p">;</span>
<span class="kr">edit_fstab</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="kr">unmount</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##-------------------------------------------------------</span>
<span class="c">## process promises</span>
<span class="c">##-------------------------------------------------------</span>

<span class="k">body</span> <span class="k">process_select</span> <span class="nf">exclude_procs</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">command</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">process_result</span> <span class="o">=&gt;</span> <span class="s">&quot;!command&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">process_select</span> <span class="nf">days_older_than</span><span class="p">(</span><span class="nv">d</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">stime_range</span>    <span class="o">=&gt;</span> <span class="nf">irange</span><span class="p">(</span><span class="nf">ago</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(d)</span><span class="s">&quot;</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">),</span><span class="nf">now</span><span class="p">);</span>
<span class="kr">process_result</span> <span class="o">=&gt;</span> <span class="s">&quot;stime&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">process_count</span> <span class="nf">any_count</span><span class="p">(</span><span class="nv">cl</span><span class="p">)</span>

<span class="p">{</span>
<span class="kr">match_range</span> <span class="o">=&gt;</span> <span class="s">&quot;0,0&quot;</span><span class="p">;</span>
<span class="kr">out_of_range_define</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(cl)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">process_count</span> <span class="nf">check_range</span><span class="p">(</span><span class="nv">name</span><span class="p">,</span><span class="nv">lower</span><span class="p">,</span><span class="nv">upper</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">match_range</span> <span class="o">=&gt;</span> <span class="nf">irange</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(lower)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(upper)</span><span class="s">&quot;</span><span class="p">);</span>
<span class="kr">out_of_range_define</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(name)</span><span class="s">_out_of_range&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">##</span>
<span class="c">## service promises</span>
<span class="c">##</span>

<span class="k">body</span> <span class="k">service_method</span> <span class="nf">bootstart</span>
<span class="p">{</span>
  <span class="kr">service_autostart_policy</span> <span class="o">=&gt;</span> <span class="s">&quot;boot_time&quot;</span><span class="p">;</span>
  <span class="kr">service_dependence_chain</span> <span class="o">=&gt;</span> <span class="s">&quot;start_parent_services&quot;</span><span class="p">;</span>
<span class="nc">windows</span><span class="p">::</span>
  <span class="kr">service_type</span> <span class="o">=&gt;</span> <span class="s">&quot;windows&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">service_method</span> <span class="nf">force_deps</span>
<span class="p">{</span>
  <span class="kr">service_dependence_chain</span> <span class="o">=&gt;</span> <span class="s">&quot;all_related&quot;</span><span class="p">;</span>
<span class="nc">windows</span><span class="p">::</span>
  <span class="kr">service_type</span> <span class="o">=&gt;</span> <span class="s">&quot;windows&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">####################################################</span>
<span class="c">## monitor bodyparts</span>
<span class="c">####################################################</span>

<span class="k">body</span> <span class="k">match_value</span> <span class="nf">scan_log</span><span class="p">(</span><span class="nv">line</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">select_line_matching</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(line)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">track_growing_file</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">match_value</span> <span class="nf">scan_changing_file</span><span class="p">(</span><span class="nv">line</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">select_line_matching</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(line)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">track_growing_file</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">##</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">sample_rate</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
<span class="kr">ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="kr">expireafter</span> <span class="o">=&gt;</span> <span class="s">&quot;10&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


----

{% include codeindex.markdown %}
