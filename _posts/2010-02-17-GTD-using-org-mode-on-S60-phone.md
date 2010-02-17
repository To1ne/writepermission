--- 
layout: post
title: GTD using org-mode on S60 phone
---
## Aim
The aim of this post is setting up a system for GTD (TODO acronym) on a S60 mobile phone. For this setup we'll use `emacs org-mode`.

## Install emacs with org-mode
The most recent versions of `emacs` include `org-mode` by default. So we just have to download and install it.
{% highlight bash %}
mkdir -p /usr/src/emacs
cd /usr/src/emacs
wget http://ftp.gnu.org/gnu/emacs/emacs-23.1.tar.gz
tar -xzf emacs-23.1.tar.gz
cd emacs-23.1
./configure
make
make install
{% endhighlight %}

At my system I got the following error:
{% highlight text %}
makeinfo is missing - cannot build manuals
{%endhighlight%}

To solve this problem provide the option `--without-makeinfo` to the `./configure` command above. (ref http://osdir.com/ml/wp-forums/2009-08/msg00001.html )