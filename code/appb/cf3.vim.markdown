---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/appb/cf3.vim.html
posttitle: Code > Chapter appb > cf3.vim
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/appb/cf3.vim)

<div class="highlight"><pre><span class="s">&quot; Vim file plugin</span>
<span class="s">&quot;</span> <span class="nf">This</span> <span class="nf">is</span> <span class="nf">my</span> <span class="nf">first</span> <span class="nf">attempt</span> <span class="nf">at</span> <span class="nf">a</span> <span class="nf">ftplugin</span> <span class="nf">file</span><span class="err">.</span>  <span class="nf">Feel</span> <span class="nf">free</span> <span class="nf">to</span> <span class="nf">send</span> <span class="nf">me</span>
<span class="s">&quot; corrections or improvements.  I&#39;ll give you a credit.</span>
<span class="s">&quot;</span>
<span class="s">&quot; USAGE</span>
<span class="s">&quot;</span> <span class="nf">There</span> <span class="nf">is</span> <span class="nf">already</span> <span class="nf">a</span> <span class="nf">vim</span> <span class="nf">file</span> <span class="nf">that</span> <span class="nf">uses</span> <span class="err">&#39;</span><span class="nf">cf</span><span class="err">&#39;</span> <span class="nf">as</span> <span class="nf">a</span> <span class="nf">file</span> <span class="nf">extension</span><span class="err">.</span>  <span class="nf">You</span> <span class="nf">can</span> <span class="nf">use</span>
<span class="s">&quot; cf3 for your cf3 file extensions or identify via your vimrc file:</span>
<span class="s">&quot;</span> <span class="nf">au</span> <span class="nf">BufRead</span><span class="p">,</span><span class="nf">BufNewFile</span> <span class="err">*.</span><span class="nf">cf</span> <span class="nf">set</span> <span class="nf">ft</span><span class="err">=</span><span class="nf">cf3</span>

<span class="s">&quot; Check to see if DisableCF3Ftplugin is defined</span>
<span class="s">&quot;</span> <span class="nf">If</span> <span class="nf">you</span> <span class="nf">only</span> <span class="nf">want</span> <span class="nf">the</span> <span class="nf">syntax</span> <span class="nf">plugin</span> <span class="nf">add</span> <span class="s">&quot;let g:DisableCF3Ftplugin=1&quot;</span> <span class="nf">in</span>
<span class="s">&quot; ~/.vimrc</span>
<span class="s">if exists(&quot;</span><span class="kd">g</span><span class="p">:</span><span class="nf">DisableCF3Ftplugin</span><span class="s">&quot;)</span>
<span class="s">    finish</span>
<span class="s">endif</span>

<span class="s">&quot;</span> <span class="nf">Only</span> <span class="nf">do</span> <span class="nf">this</span> <span class="nf">when</span> <span class="nf">not</span> <span class="nf">done</span> <span class="nf">yet</span> <span class="nf">for</span> <span class="nf">this</span> <span class="nf">buffer</span>
<span class="nf">if</span> <span class="nf">exists</span><span class="p">(</span><span class="s">&quot;b:did_ftplugin&quot;</span><span class="p">)</span>
  <span class="nf">finish</span>
<span class="nf">endif</span>
<span class="nf">let</span> <span class="kd">b</span><span class="p">:</span><span class="nf">did_ftplugin</span> <span class="err">=</span> <span class="mi">1</span>

<span class="s">&quot; =============== Keyword Abbreviations  ===============</span>
<span class="s">&quot;</span> <span class="nf">disable</span> <span class="nf">keyword</span> <span class="nf">abbreviations</span> <span class="nf">with</span> <span class="nf">by</span> <span class="nf">adding</span> 
<span class="s">&quot; &quot;</span><span class="nf">let</span> <span class="kd">g</span><span class="p">:</span><span class="nf">DisableCFE3KeywordAbbreviations</span><span class="err">=</span><span class="mi">0</span><span class="s">&quot; to your vimrc</span>
<span class="s">&quot;</span> <span class="nf">Conveniance</span> <span class="nf">function</span> <span class="nf">ToggleCFE3KeywordAbbreviations</span>
<span class="s">&quot; mapped to ,i by default to toggle abbreviations off or on</span>
<span class="s">&quot;</span>
<span class="nf">function</span><span class="err">!</span> <span class="nf">EnableCFE3KeywordAbbreviations</span><span class="p">()</span>
    <span class="nf">iab</span> <span class="kr">=</span> <span class="o">=&gt;</span>
    <span class="nf">iab</span> <span class="nf">bu</span> <span class="k">bundle</span>
    <span class="k">iab</span> <span class="nf">han</span> <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;&lt;C-R&gt;=Eatchar(&#39;</span><span class="se">\s</span><span class="s">&#39;)&lt;CR&gt;</span>
<span class="s">    iab cla classes:</span>
<span class="s">    iab comma commands:</span>
<span class="s">    iab comme comment =&gt; &quot;</span><span class="err">&lt;</span><span class="nf">C</span><span class="err">-</span><span class="nf">R</span><span class="err">&gt;=</span><span class="nf">Eatchar</span><span class="p">(</span><span class="err">&#39;\</span><span class="nf">s</span><span class="err">&#39;</span><span class="p">)</span><span class="err">&lt;</span><span class="nf">CR</span><span class="err">&gt;</span>
    <span class="nf">iab</span> <span class="nf">fil</span> <span class="kd">files</span><span class="p">:</span>
    <span class="nf">iab</span> <span class="nf">met</span> <span class="kd">methods</span><span class="p">:</span>
    <span class="nf">iab</span> <span class="nf">pro</span> <span class="kd">processes</span><span class="p">:</span>
    <span class="nf">iab</span> <span class="nf">rep</span> <span class="kd">reports</span><span class="p">:</span>
    <span class="nf">iab</span> <span class="nf">var</span> <span class="kd">vars</span><span class="p">:</span>
    <span class="nf">iab</span> <span class="nf">ba</span> <span class="k">bundle</span> <span class="k">agent</span>
    <span class="nf">iab</span> <span class="nf">bc</span> <span class="k">bundle</span> <span class="k">common</span>
    <span class="nf">iab</span> <span class="nf">ub</span> <span class="kr">usebundle</span> <span class="o">=&gt;</span>
    <span class="nf">iab</span> <span class="nf">str</span> <span class="kr">string</span> <span class="o">=&gt;</span> <span class="s">&quot;&lt;C-R&gt;=Eatchar(&#39;</span><span class="se">\s</span><span class="s">&#39;)&lt;CR&gt;</span>
<span class="s">    iab sli slist =&gt; {</span>
<span class="s">    echo &quot;</span><span class="nf">CFEngine</span> <span class="mi">3</span> <span class="nf">Keyword</span> <span class="nf">Abbreviations</span> <span class="nf">enabled</span><span class="s">&quot;</span>
<span class="s">endfunction</span>

<span class="s">function! DisableCFE3KeywordAbbreviations()</span>
<span class="s">    iunab =</span>
<span class="s">    iunab bu</span>
<span class="s">    iunab han </span>
<span class="s">    iunab cla</span>
<span class="s">    iunab comma</span>
<span class="s">    iunab comme</span>
<span class="s">    iunab fil</span>
<span class="s">    iunab met</span>
<span class="s">    iunab pro</span>
<span class="s">    iunab rep</span>
<span class="s">    iunab var</span>
<span class="s">    iunab ba</span>
<span class="s">    iunab bc</span>
<span class="s">    iunab ub</span>
<span class="s">    iunab str</span>
<span class="s">    iunab sli</span>
<span class="s">    echo &quot;</span><span class="nf">CFEngine</span> <span class="mi">3</span> <span class="nf">Keyword</span> <span class="nf">Abbreviations</span> <span class="nf">disabled</span><span class="s">&quot;</span>
<span class="s">endfunction</span>

<span class="s">&quot;</span> <span class="nf">Default</span> <span class="nf">abbreviations</span> <span class="nf">on</span>
<span class="s">&quot; to disable let g:DisableCFE3KeywordAbbreviations=1 in ~/.vimrc</span>
<span class="s">if !exists(&#39;g:DisableCFE3KeywordAbbreviations&#39;)</span>
<span class="s">    let g:DisableCFE3KeywordAbbreviations=1</span>
<span class="s">    call EnableCFE3KeywordAbbreviations()</span>
<span class="s">endif</span>

<span class="s">function! ToggleCFE3KeywordAbbreviations()</span>
<span class="s">    if !exists(&#39;g:DisableCFE3KeywordAbbreviations&#39;)</span>
<span class="s">        let g:DisableCFE3KeywordAbbreviations=1</span>
<span class="s">        call EnableCFE3KeywordAbbreviations()</span>
<span class="s">    else</span>
<span class="s">        unlet g:DisableCFE3KeywordAbbreviations</span>
<span class="s">        call DisableCFE3KeywordAbbreviations()</span>
<span class="s">    endif</span>
<span class="s">endfunction</span>

<span class="s">&quot;</span> <span class="nf">maps</span>
<span class="s">&quot; Toggle KeywordAbbreviations</span>
<span class="s">nmap ,i :call ToggleCFE3KeywordAbbreviations()&lt;CR&gt;</span>
<span class="s">&quot;</span> <span class="nf">Wrap</span> <span class="nf">WORD</span> <span class="nf">in</span> <span class="nf">double</span> <span class="nf">quotes</span>
<span class="nf">nmap</span> <span class="p">,</span><span class="nf">q</span> <span class="nf">dE</span><span class="err">&lt;</span><span class="nf">ESC</span><span class="err">&gt;</span><span class="nf">i</span><span class="s">&quot;&lt;ESC&gt;pa&quot;</span><span class="err">&lt;</span><span class="nf">ESC</span><span class="err">&gt;</span>
<span class="s">&quot; Insert blank promise</span>
<span class="s">nmap ,p o&quot;</span><span class="kr">&quot;&lt;CR&gt;&lt;TAB&gt;handle</span> <span class="o">=&gt;</span> <span class="kr">&quot;&quot;,&lt;CR&gt;&lt;TAB&gt;comment</span> <span class="o">=&gt;</span> <span class="s">&quot;&quot;</span><span class="err">&lt;</span><span class="nf">ESC</span><span class="err">&gt;</span><span class="nf">kk0li</span>
<span class="s">&quot; quote list items</span>
<span class="s">vmap ,q :s/^</span><span class="se">\s</span><span class="s">*</span><span class="se">\(</span><span class="s">.*</span><span class="se">\)\s</span><span class="s">*$/&quot;</span><span class="err">\</span><span class="mi">1</span><span class="s">&quot;,/g&lt;CR&gt;</span>
<span class="s">&quot;</span> <span class="nf">Insert</span> <span class="nf">whole</span> <span class="nf">self</span> <span class="nf">contained</span> <span class="nf">skeleton</span>
<span class="nf">nmap</span> <span class="p">,</span><span class="nf">k</span> <span class="nf">Obody</span> <span class="nf">common</span> <span class="nf">control</span> <span class="p">{</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span>
<span class="kr">\&lt;CR&gt;bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span><span class="s">&quot;main&quot;</span><span class="p">,</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span><span class="p">};</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span>
<span class="kr">\&lt;CR&gt;inputs</span> <span class="o">=&gt;</span> <span class="p">{</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span><span class="s">&quot;cfengine_stdlib.cf&quot;</span><span class="p">,</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span><span class="p">};</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span><span class="p">}</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">main</span> <span class="p">{</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span><span class="kd">methods</span><span class="p">:</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span><span class="s">&quot;any&quot;</span> <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">test</span><span class="p">;</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span><span class="p">}</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span> <span class="p">{</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span>
<span class="err">\&lt;</span><span class="nf">CR</span><span class="err">&gt;</span><span class="p">}</span><span class="err">&lt;</span><span class="nf">ESC</span><span class="err">&gt;</span>

<span class="s">&quot; Function to align groups of =&gt; assignment lines.</span>
<span class="s">&quot;</span> <span class="nf">Credit</span> <span class="nf">to</span> <span class="err">&#39;</span><span class="nf">Scripting</span> <span class="nf">the</span> <span class="nf">Vim</span> <span class="nf">editor</span><span class="p">,</span> <span class="nf">Part</span> <span class="kd">2</span><span class="p">:</span> <span class="nf">User</span><span class="err">-</span><span class="nf">defined</span> <span class="nf">functions</span><span class="err">&#39;</span>
<span class="s">&quot; by Damian Conway</span>
<span class="s">&quot;</span> <span class="kd">http</span><span class="p">:</span><span class="err">//</span><span class="nf">www</span><span class="err">.</span><span class="nf">ibm</span><span class="err">.</span><span class="nf">com</span><span class="err">/</span><span class="nf">developerworks</span><span class="err">/</span><span class="nf">linux</span><span class="err">/</span><span class="nf">library</span><span class="err">/</span><span class="nf">l</span><span class="err">-</span><span class="nf">vim</span><span class="err">-</span><span class="nf">script</span><span class="err">-</span><span class="mi">2</span><span class="err">/</span><span class="nf">index</span><span class="err">.</span><span class="nf">html</span>
<span class="nf">if</span> <span class="err">!</span><span class="nf">exists</span><span class="p">(</span><span class="s">&quot;*CF3AlignAssignments&quot;</span><span class="p">)</span>
<span class="nf">function</span> <span class="nf">CF3AlignAssignments</span> <span class="p">()</span>
    <span class="s">&quot;Patterns needed to locate assignment operators...</span>
<span class="s">    let ASSIGN_OP   = &#39;</span><span class="se">\(</span><span class="s">string</span><span class="se">\|</span><span class="s">int</span><span class="se">\|</span><span class="s">real</span><span class="se">\|</span><span class="s">slist</span><span class="se">\|</span><span class="s">ilist</span><span class="se">\|</span><span class="s">rlist</span><span class="se">\|</span><span class="s">expression</span><span class="se">\|</span><span class="s">and</span><span class="se">\|</span><span class="s">or</span><span class="se">\|</span><span class="s">not</span><span class="se">\|</span><span class="s">volume</span><span class="se">\)</span><span class="s">*</span><span class="se">\s\+</span><span class="s">=&gt;&#39;</span>
<span class="s">    let ASSIGN_LINE = &#39;^</span><span class="se">\(</span><span class="s">.</span><span class="se">\{</span><span class="s">-}</span><span class="se">\)\s</span><span class="s">*</span><span class="se">\(</span><span class="s">&#39; . ASSIGN_OP . &#39;</span><span class="se">\)</span><span class="s">&#39;</span>

<span class="s">    &quot;</span><span class="nf">Locate</span> <span class="nf">block</span> <span class="nf">of</span> <span class="nf">code</span> <span class="nf">to</span> <span class="nf">be</span> <span class="nf">considered</span> <span class="p">(</span><span class="nf">same</span> <span class="nf">indentation</span><span class="p">,</span> <span class="nf">no</span> <span class="nf">blanks</span><span class="p">)</span>
    <span class="nf">let</span> <span class="nf">indent_pat</span> <span class="err">=</span> <span class="err">&#39;^&#39;</span> <span class="err">.</span> <span class="nf">matchstr</span><span class="p">(</span><span class="nf">getline</span><span class="p">(</span><span class="err">&#39;.&#39;</span><span class="p">),</span> <span class="err">&#39;^\</span><span class="nf">s</span><span class="err">*&#39;</span><span class="p">)</span> <span class="err">.</span> <span class="err">&#39;\</span><span class="nf">S</span><span class="err">&#39;</span>
    <span class="nf">let</span> <span class="nf">firstline</span>  <span class="err">=</span> <span class="nf">search</span><span class="p">(</span><span class="err">&#39;^\%</span><span class="p">(</span><span class="err">&#39;.</span> <span class="nf">indent_pat</span> <span class="err">.</span> <span class="err">&#39;\</span><span class="p">)</span><span class="err">\@!&#39;</span><span class="p">,</span><span class="err">&#39;</span><span class="nf">bnW</span><span class="err">&#39;</span><span class="p">)</span> <span class="err">+</span> <span class="mi">1</span>
    <span class="nf">let</span> <span class="nf">lastline</span>   <span class="err">=</span> <span class="nf">search</span><span class="p">(</span><span class="err">&#39;^\%</span><span class="p">(</span><span class="err">&#39;.</span> <span class="nf">indent_pat</span> <span class="err">.</span> <span class="err">&#39;\</span><span class="p">)</span><span class="err">\@!&#39;</span><span class="p">,</span> <span class="err">&#39;</span><span class="nf">nW</span><span class="err">&#39;</span><span class="p">)</span> <span class="err">-</span> <span class="mi">1</span>
    <span class="nf">if</span> <span class="nf">lastline</span> <span class="err">&lt;</span> <span class="mi">0</span>
        <span class="nf">let</span> <span class="nf">lastline</span> <span class="err">=</span> <span class="nf">line</span><span class="p">(</span><span class="err">&#39;$&#39;</span><span class="p">)</span>
    <span class="nf">endif</span>

    <span class="s">&quot;Find the column at which the operators should be aligned...</span>
<span class="s">    let max_align_col = 0</span>
<span class="s">    let max_op_width  = 0</span>
<span class="s">    for linetext in getline(firstline, lastline)</span>
<span class="s">        &quot;</span><span class="nf">Does</span> <span class="nf">this</span> <span class="nf">line</span> <span class="nf">have</span> <span class="nf">an</span> <span class="nf">assignment</span> <span class="nf">in</span> <span class="nf">it</span><span class="err">?</span>
        <span class="nf">let</span> <span class="nf">left_width</span> <span class="err">=</span> <span class="nf">match</span><span class="p">(</span><span class="nf">linetext</span><span class="p">,</span> <span class="err">&#39;\</span><span class="nf">s</span><span class="err">*&#39;</span> <span class="err">.</span> <span class="nf">ASSIGN_OP</span><span class="p">)</span>

        <span class="s">&quot;If so, track the maximal assignment column and operator width...</span>
<span class="s">        if left_width &gt;= 0</span>
<span class="s">            let max_align_col = max([max_align_col, left_width])</span>

<span class="s">            let op_width      = strlen(matchstr(linetext, ASSIGN_OP))</span>
<span class="s">            let max_op_width  = max([max_op_width, op_width+1])</span>
<span class="s">         endif</span>
<span class="s">    endfor</span>

<span class="s">    &quot;</span><span class="nf">Code</span> <span class="nf">needed</span> <span class="nf">to</span> <span class="nf">reformat</span> <span class="nf">lines</span> <span class="nf">so</span> <span class="nf">as</span> <span class="nf">to</span> <span class="nf">align</span> <span class="nf">operators</span><span class="err">...</span>
    <span class="nf">let</span> <span class="nf">FORMATTER</span> <span class="err">=</span> <span class="err">&#39;\=</span><span class="nf">printf</span><span class="p">(</span><span class="s">&quot;%-*s%*s&quot;</span><span class="p">,</span> <span class="nf">max_align_col</span><span class="p">,</span> <span class="nf">submatch</span><span class="p">(</span><span class="mi">1</span><span class="p">),</span>
    <span class="err">\</span>                                    <span class="nf">max_op_width</span><span class="p">,</span>  <span class="nf">submatch</span><span class="p">(</span><span class="mi">2</span><span class="p">))</span><span class="err">&#39;</span>

    <span class="s">&quot; Reformat lines with operators aligned in the appropriate column...</span>
<span class="s">    for linenum in range(firstline, lastline)</span>
<span class="s">        let oldline = getline(linenum)</span>
<span class="s">        let newline = substitute(oldline, ASSIGN_LINE, FORMATTER, &quot;&quot;)</span>
<span class="s">        call setline(linenum, newline)</span>
<span class="s">    endfor</span>
<span class="s">endfunction</span>
<span class="s">endif</span>

<span class="s">nmap &lt;silent&gt;  ,=  :call CF3AlignAssignments()&lt;CR&gt;</span>

<span class="s">&quot;</span> <span class="nf">TODO</span>
<span class="s">&quot; Folding</span>
<span class="s">&quot;</span> <span class="nf">Indents</span>

<span class="s">&quot; CREDITS</span>
<span class="s">&quot;</span> <span class="nf">Neil</span> <span class="nf">Watson</span> <span class="err">&lt;</span><span class="nf">neil</span><span class="err">@</span><span class="nf">watson</span><span class="err">-</span><span class="nf">wilson</span><span class="err">.</span><span class="nf">ca</span><span class="err">&gt;</span>
<span class="s">&quot; Other Cfengine information: http://watson-wilson.ca/cfengine/</span>
<span class="s">&quot;</span>
<span class="s">&quot; CHANGES</span>
<span class="s">&quot;</span> <span class="nf">Wednesday</span> <span class="nf">October</span> <span class="mi">05</span> <span class="mi">2011</span>
<span class="s">&quot; - Added comment and handle abbs.  Assumes you have the Eatchar and Getchar</span>
<span class="s">&quot;</span> <span class="nf">functions</span><span class="err">.</span>
<span class="s">&quot; - Can now wrap words and lists in quotes.</span>
<span class="s">&quot;</span> <span class="err">-</span> <span class="nf">Insert</span> <span class="nf">blank</span> <span class="nf">promises</span> <span class="p">(,</span><span class="nf">p</span><span class="p">)</span>
<span class="s">&quot; - Insert blank testing skeleton (,k)</span>
<span class="s">&quot;</span>
<span class="s">&quot; CHANGES</span>
<span class="s">&quot;</span> <span class="nf">Monday</span> <span class="nf">November</span> <span class="mi">21</span> <span class="mi">2011</span>
<span class="s">&quot; - IAB&#39;s for string, slist and usebundle.</span>

<span class="s">&quot;</span> <span class="nf">CHANGES</span>
<span class="s">&quot; Fri Apr 27 2012</span>
<span class="s">&quot;</span> <span class="nf">Added</span> <span class="nf">function</span> <span class="nf">to</span> <span class="nf">align</span> <span class="nf">assigment</span> <span class="nf">operators</span>

<span class="s">&quot; vim_cf3 files (https://github.com/neilhwatson/vim_cf3)</span>
<span class="s">&quot;</span> <span class="nf">Copyright</span> <span class="p">(</span><span class="nf">C</span><span class="p">)</span> <span class="mi">2011</span> <span class="nf">Neil</span> <span class="nf">H</span><span class="err">.</span> <span class="nf">Watson</span> <span class="err">&lt;</span><span class="nf">neil</span><span class="err">@</span><span class="nf">watson</span><span class="err">-</span><span class="nf">wilson</span><span class="err">.</span><span class="nf">ca</span><span class="err">&gt;</span>
<span class="s">&quot; </span>
<span class="s">&quot;</span> <span class="nf">This</span> <span class="nf">program</span> <span class="nf">is</span> <span class="nf">free</span> <span class="kd">software</span><span class="p">:</span> <span class="nf">you</span> <span class="nf">can</span> <span class="nf">redistribute</span> <span class="nf">it</span> <span class="nf">and</span><span class="err">/</span><span class="nf">or</span> <span class="nf">modify</span> <span class="nf">it</span> <span class="nf">under</span>
<span class="s">&quot; the terms of the GNU General Public License as published by the Free Software</span>
<span class="s">&quot;</span> <span class="nf">Foundation</span><span class="p">,</span> <span class="nf">either</span> <span class="nf">version</span> <span class="mi">3</span> <span class="nf">of</span> <span class="nf">the</span> <span class="nf">License</span><span class="p">,</span> <span class="nf">or</span> <span class="p">(</span><span class="nf">at</span> <span class="nf">your</span> <span class="nf">option</span><span class="p">)</span> <span class="nf">any</span> <span class="nf">later</span>
<span class="s">&quot; version.</span>
<span class="s">&quot;</span> 
<span class="s">&quot; This program is distributed in the hope that it will be useful, but WITHOUT ANY</span>
<span class="s">&quot;</span> <span class="nf">WARRANTY</span><span class="p">;</span> <span class="nf">without</span> <span class="nf">even</span> <span class="nf">the</span> <span class="nf">implied</span> <span class="nf">warranty</span> <span class="nf">of</span> <span class="nf">MERCHANTABILITY</span> <span class="nf">or</span> <span class="nf">FITNESS</span> <span class="nf">FOR</span> <span class="nf">A</span>
<span class="s">&quot; PARTICULAR PURPOSE.  See the GNU General Public License for more details.</span>
<span class="s">&quot;</span> 
<span class="s">&quot; You should have received a copy of the GNU General Public License along with</span>
<span class="s">&quot;</span> <span class="nf">this</span> <span class="nf">program</span><span class="err">.</span>  <span class="nf">If</span> <span class="nf">not</span><span class="p">,</span> <span class="nf">see</span> <span class="err">&lt;</span><span class="kd">http</span><span class="p">:</span><span class="err">//</span><span class="nf">www</span><span class="err">.</span><span class="nf">gnu</span><span class="err">.</span><span class="nf">org</span><span class="err">/</span><span class="nf">licenses</span><span class="err">/&gt;.</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
