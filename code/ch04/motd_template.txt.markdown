---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/motd_template.txt.html
posttitle: Code > Chapter 4 > motd_template.txt
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/motd_template.txt)

<div class="highlight"><pre><span class="nf">This</span> <span class="nf">system</span> <span class="nf">may</span> <span class="nf">be</span> <span class="nf">accessed</span> <span class="nf">by</span> <span class="nf">authorized</span> <span class="nf">users</span> <span class="nf">only</span><span class="err">.</span>
<span class="nf">Use</span> <span class="nf">of</span> <span class="nf">this</span> <span class="nf">system</span> <span class="nf">implies</span> <span class="nf">acceptance</span> <span class="nf">of</span> <span class="nf">authorized</span> <span class="nf">use</span> <span class="nf">policies</span><span class="err">.</span>
<span class="nf">Misuse</span> <span class="nf">may</span> <span class="nf">be</span> <span class="nf">subject</span> <span class="nf">to</span> <span class="nf">prosecution</span><span class="err">.</span>

<span class="kd">Host</span><span class="p">:</span> <span class="err">$</span><span class="p">(</span><span class="nf">sys</span><span class="err">.</span><span class="nf">fqhost</span><span class="p">)</span> <span class="p">(</span><span class="err">$</span><span class="p">(</span><span class="nf">sys</span><span class="err">.</span><span class="nf">ipv4</span><span class="p">))</span>
<span class="nf">This</span> <span class="nf">system</span> <span class="nf">is</span> <span class="nf">managed</span> <span class="nf">by</span> <span class="nf">CFEngine</span> <span class="nf">v</span><span class="err">$</span><span class="p">(</span><span class="nf">sys</span><span class="err">.</span><span class="nf">cf_version</span><span class="p">)</span>
<span class="nf">This</span> <span class="nf">file</span> <span class="nf">was</span> <span class="nf">generated</span> <span class="nf">from</span> <span class="err">$</span><span class="p">(</span><span class="nf">login_banner</span><span class="err">.</span><span class="nf">template_file</span><span class="p">)</span>
</pre></div>


----

{% include codeindex.markdown %}
