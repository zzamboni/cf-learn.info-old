#!/usr/bin/env ruby
#

require 'fileutils'
require 'open-uri'

######################################################################

Debug = false
RefGuideUrl = 'https://cfengine.com/manuals/cf3-reference.html'
OutDir = "./ref"
# Words not to index
Skipwords = %W(how the ago and are for non vs. what best bare that thus)

######################################################################

def read_sections
  result = {}
  a_names = []
  open(RefGuideUrl) do |url|
    url.each_line do |l|
      if l =~ /\<a name="(.*?)"/
        a_names.push($1)
      elsif l =~ /\<h\d.*?\>(.*)\</
        title = $1
        a_names.each { |n|
          result[n] = $1
        }
        a_names = []
      end
    end
  end
  if Debug
    result.keys.sort.each { |k|
      puts "#{k}: #{result[k]}"
    }
  end
  return result
end

def cross_ref(sections)
  result = {}
  sections.keys.each do |k|
    # Filter out some garbage
    next if k =~ /(00\d|%\d|^index-)/
    # Elminate all "in <whatever>" parts, to avoid spurious indexing - the <whatever>
    # will be indexed in its own section
    k2=k.gsub(/-in-.*/, "")
    c1 = k2.split(' ')
    c2 = k2.split(/_+/)
    c3 = k2.split(/-+/)
    c4 = k2.split(/\.+/)
    (c1+c2+c3+c4+[k, k2]).each { |c2|
      c=c2.downcase
      next if c.length < 3 or Skipwords.include?(c)
      result[c] = [] unless result.include?(c)
      result[c].push(k) unless result[c].include?(k)
    }
  end
  return result
end

def write_ref_file(i, index, sections)
  ext = (index.length == 1) ? "html" : "markdown"
  FileUtils.mkpath("#{OutDir}/#{i}")
  File.open("#{OutDir}/#{i}/index.#{ext}", "w") do |f|
    # Write a redirect if there's only one section related to the current index,
    # write a disambiguation page if there's more than one.
    if index.length == 1
      f.print <<EOF
<html>
  <head>
    <title>CFEngine documentation</title>
  </head>
  <body onload="window.location.replace('#{RefGuideUrl}\##{index[0]}')">
  <p>Sending you to <a href="#{RefGuideUrl}\##{index[0]}">#{sections[index[0]]}</a></p>
  </body>
</html>
EOF
    else
      f.print <<EOF
---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /ref/#{i}
posttitle: Reference disambiguation for '#{i}'
navsection: none
---

The term '#{i}' could refer to several sections in the documentation. Please choose one:

EOF
      index.each { |j|
        text = sections[j].gsub(/([\*\`\[\]\\\_\(\)\{\}\#\+\-\.\!])/) { |m| "\\#{m}" }
        f.puts(%Q(- [#{text}](#{RefGuideUrl}\##{j})))
      }
    end
  end
end

def main
  sections = read_sections
  index = cross_ref(sections)
  index.keys.sort.each { |i|
    if Debug
      puts %Q(<a href="#{RefGuideUrl}\##{index[i]}">#{i}</a> = #{index[i]}  (#{sections[index[i]]})<br>)
    end
    write_ref_file(i, index[i], sections)
  }
  # Write a redirect to the main documentation page
  write_ref_file("", [""], { "" => "CFEngine Reference Manual"})
end

# Do something if invoked directly (instead of included as a module)
if __FILE__ == $0
  main
end
