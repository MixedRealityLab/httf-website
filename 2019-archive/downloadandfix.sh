#!/bin/bash

 wget \
     --recursive \
     --no-clobber \
     --page-requisites \
     --html-extension \
     --restrict-file-names=windows \
     --domains halfwaytothefuture.org \
     https://www.halfwaytothefuture.org/

files=`find . -name "*.html"`
for f in $files; do
 d=`echo "$f" | cut -c3-`
 d=${d%".html"}
 mkdir -p $d;
 mv $f $d/index.php
done
mv index/index.php .
rmdir index

# fix robots.txt
# remove <p>Powered by <a href="https://bolt.cm" title="Bolt CMS">Bolt CMS</a>. </p>
# replace <meta name="generator" content="Bolt"> with <meta name="generator" content="Bolt (Archived)">
# fix sitemap.xml (change URLs and changefreq to never)
# replace "/ with "/2019/ in all files
# replace \.([a-z]+)\?[a-z0-9]+" with .$1"
# replace https://www.halfwaytothefuture.org/files/ with https://www.halfwaytothefuture.org/2019/files/
# replace <base href="https://www.halfwaytothefuture.org/"> with <base href="https://www.halfwaytothefuture.org/2019/">
# replace https://www.halfwaytothefuture.org/sitemap.xml with https://www.halfwaytothefuture.org/sitemap.xml
# replace <link rel="canonical" href="https://www.halfwaytothefuture.org/ with <link rel="canonical" href="https://www.halfwaytothefuture.org/2019/
# remove caching values from files in the files/ and theme/* directories
# remove form and extra JS from report/index.php and extensions directory