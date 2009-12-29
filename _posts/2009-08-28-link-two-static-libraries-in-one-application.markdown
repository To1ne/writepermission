--- 
wordpress_id: 176
layout: post
title: Link two static libraries in one application
wordpress_url: http://blog.tonotdo.com/?p=176
---
<h3>Introduction</h3>
This is a technical post about compiling a C/C++ application using <a href="http://en.wikipedia.org/wiki/GNU_Compiler_Collection">gcc</a>. This post requires understanding of <a href="http://en.wikipedia.org/wiki/C_%28programming_language%29">C programming</a> and building it.

I'm about to discribe a problem that made my loose several hours searching for the problem, while the solution was quite simple.

<!--more-->
<h3>Situation</h3>
I was working on an application that uses two <a href="http://en.wikipedia.org/wiki/Static_library">static libraries</a>, or so called archives. My application uses functions from one library, while that library uses functions from another library. This situation sound complex, but I'll explain using an example.
<h3>Example</h3>
The application <code>helloWorld.app</code> uses two archives <code>libArchive1.a</code> and <code>libArchive2.a</code>.
<h4>libArchive1.a</h4>
This first archive is build from:
<code>libArchive1/libArchive1.h</code>
<pre lang="c">#include 
std::string GetHello();</pre>
<code>libArchive1/libArchive1.c</code>
<pre lang="c">#include "libArchive1.h"
std::string GetHello() { return std::string("Hello "); }</pre>
You can compile these files to an archive using these 2 commands:
<pre lang="Makefile">g++ -c libArchive1/libArchive1.c -o libArchive1/libArchive1.o
ar rcs libArchive1/libArchive1.a libArchive1/libArchive1.o</pre>
<h4>libArchive2.a</h4>
Similar library to <code>libArchive1.a</code> with use of the <code>GetHello()</code> function:
<code>libArchive2/libArchive2.h</code>
<pre lang="c">#include 
#include "libArchive1.h"
std::string GetHelloWorld();</pre>
<code>libArchive2/libArchive2.c</code>
<pre lang="c">#include "libArchive2.h"
std::string GetHelloWorld() { return GetHello() + std::string("World!\n"); }</pre>
Compile by:
<pre lang="Makefile">g++ -c libArchive2/libArchive2.c -IlibArchive1 -o libArchive2/libArchive2.o
ar rcs libArchive2/libArchive2.a libArchive2/libArchive2.o</pre>
This will require to provide the parameter <code>-I</code> so the compiler knows where to get the file "libArchive1.h".
<h4>helloWorld.app</h4>
Small application printing "Hello World!" to <a href="http://en.wikipedia.org/wiki/Standard_streams#Standard_output_.28stdout.29">stdout</a> using the <code>GetHelloWorld()</code> function.
<code>printHelloWorld.c</code>
<pre lang="c">#include          // for cout
#include "libArchive2.h"
int main(int argc, char* argv[]) {
   std::cout << GetHelloWorld();
   return 0;
}</pre>
Now here is where the problem arised, compiling the application. This is what I did:
<pre lang="Makefile">g++ helloWorldApp/printHelloWorld.c -IlibArchive1 -IlibArchive2 -LlibArchive1 -LlibArchive2 -lArchive1 -lArchive2 -o helloWorld.app</pre>
The arguments <code>-lArchive1</code> and <code>-lArchive2</code> will tell the compiler to link in <code>libArchive1</code> and <code>libArchive1</code>. But I got the following error:
<pre lang="text">undefined reference to GetHello()</pre>
After a long search (the application I was working on was a lot more complex, so many things could have been wrong), I found the order of importing libraries with the <code>-l</code> argument matter. So after switching the order of <code>-lArchive1</code> <code>-lArchive2</code>, the application got compiled and did print the text "Hello World!" when running it.
<h3>Conclusion</h3>
The order of importing libraries matter. As far as I know it is a <a href="http://gcc.gnu.org/bugzilla/show_bug.cgi?id=6665">compiler bug</a> and seems to be solved in newer versions (on Mac OSX 10.5 it works, on OpenSUSE 11 the error occurs). Anyhow, if you have problem with this place the least depended library last in the argument list:
<pre lang="Makefile">g++ appHelloWorld/printHelloWorld.c -IlibArchive1 -IlibArchive2 -LlibArchive1 -LlibArchive2 -lArchive2 -lArchive1 -o helloWorldApp</pre>
This will sound really technical for a lot of people, but it took me too long solving it to not share it with you. I hope someone will benefit from it.

You can download the source code of this example <a href="http://blog.writepermission.com/wp-content/uploads/2009/08/Link2ArchivesInOneApp.zip">here</a>.
<h3>Further Reading</h3>
<ul>
	<li><a href="http://publications.gbdirect.co.uk/c_book/chapter4/linkage.html">The C Book - Linkage</a></li>
	<li><a href="http://stackoverflow.com/questions/45135/linker-order-gcc">Linker order - GCC</a> on stackoverflow.com</li>
</ul>
