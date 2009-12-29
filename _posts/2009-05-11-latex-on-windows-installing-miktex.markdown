--- 
wordpress_id: 96
layout: post
title: "LaTeX on Windows: Installing MikTeX"
wordpress_url: http://blog.tonotdo.com/?p=96
---
<h3>Introduction</h3>
In my graduation year I learned to use <a href="http://en.wikipedia.org/wiki/LaTeX">LaTeX</a> and I fell in love with it. The output is just so clean and consistent. 
Meanwhile it has been a while since I've used LaTeX, but I wanted to use it again. I had to install everything again because my computer got reinstalled. So I'll explain you how I did it.

<!--more-->

<h3>MikTeX</h3>
<a href="http://www.miktex.org/">MikTeX</a> consists of an implementation of TeX and a set of related programs. MiKTeX only provides the tools necessary to prepare documents using the TeX/LaTeX markup language; it does not include a text editor or graphical word processor. So it's the "engine" behind LaTeX.
MikTeX comes in 2 versions:
<ul>
<li>Basic: This installer (82 MB) contains the most used packages, what will do for most people.</li>
<li>Complete: This Net installer (3 MB) operates in two steps: Downloading (almost all available) packages (850 MB), and installing them.</li>
</ul>
They both support automatic install of missing packages, but I like to have most of them installed in case I'll need it so I've have chosen for the second option.
But I didn't use the Net installer to download the packages. In the past I had problems doing it this way, and I figured it is much easier and faster to download from a public FTP directly.

MikTeX lists all available <a href="http://miktex.org/pkg/Repositories.aspx">Repositories</a> on their site. I've used the FTP of the <a href="ftp://ftp.ntg.nl">Nederlandstalige TeX Gebruikersgroep</a>. The MikTeX packages on this FTP are in the folder: <em>/mirror/tex-archive/systems/win32/miktex/tm/</em>. So just download the <em>packages</em>-folder to a local drive using your favorite FTP client, and you can use the Net installer (select "Install packages") to install them.

That's it, now your ready to roll, for example type...
<pre lang="cmd">
pdflatex myfile.tex
</pre>
... to compile your first LaTeX document to PDF.

<h3>Online</h3>
On the net I've found two sites who provide compiling LaTeX to PDF online, both do a great job:
<ul>
	<li><a href="http://www.scribtex.com/">ScribTeX</a></li>
	<li><a href="http://www.monkeytex.com/">MonkeyTex</a></li>
</ul>
... but I would not recommend using them to edit online.
