---
layout: post
title: "LaTeX on Windows: Installing MikTeX"
wordpress_id: 96
wordpress_url: http://blog.tonotdo.com/?p=96
redirect_from: /2009/05/latex-on-windows-installing-miktex/
---

##Introduction
In my graduation year I learned to use [LaTeX](http://en.wikipedia.org/wiki/LaTeX) and I fell in love with it. The output is just so clean and consistent.
Meanwhile it has been a while since I've used LaTeX, but I wanted to use it again. I had to install everything again because my computer got reinstalled. So I'll explain you how I did it.

##MikTeX
[MikTeX](http://www.miktex.org/) consists of an implementation of TeX and a set of related programs. MiKTeX only provides the tools necessary to prepare documents using the TeX/LaTeX markup language; it does not include a text editor or graphical word processor. So it's the "engine" behind LaTeX.
MikTeX comes in 2 versions:
- Basic: This installer (82 MB) contains the most used packages, what will do for most people.
- Complete: This Net installer (3 MB) operates in two steps: Downloading (almost all available) packages (850 MB), and installing them.
They both support automatic install of missing packages, but I like to have most of them installed in case I'll need it so I've have chosen for the second option.
But I didn't use the Net installer to download the packages. In the past I had problems doing it this way, and I figured it is much easier and faster to download from a public FTP directly.

MikTeX lists all available [Repositories](http://miktex.org/pkg/Repositories.aspx) on their site. I've used the FTP of the [Nederlandstalige TeX Gebruikersgroep](ftp://ftp.ntg.nl). The MikTeX packages on this FTP are in the folder: */mirror/tex-archive/systems/win32/miktex/tm/*. So just download the *packages*-folder to a local drive using your favorite FTP client, and you can use the Net installer (select "Install packages") to install them.

That's it, now your ready to roll, for example type...
{% highlight bash %}
pdflatex myfile.tex
{% endhighlight %}
... to compile your first LaTeX document to PDF.

##Online
On the net I've found two sites who provide compiling LaTeX to PDF online, both do a great job:
- [ScribTeX](http://www.scribtex.com/)
- [MonkeyTex](http://www.monkeytex.com/)

... but I would not recommend using them to edit online.
