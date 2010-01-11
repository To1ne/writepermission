--- 
layout: post
title: Link two static libraries in one application
wordpress_id: 176
wordpress_url: http://blog.tonotdo.com/?p=176
---
## Introduction
This is a technical post about compiling a C/C++ application using [gcc](http://en.wikipedia.org/wiki/GNU_Compiler_Collection). This post requires understanding of [C programming](http://en.wikipedia.org/wiki/C_%28programming_language%29) and building it.

I'm about to discribe a problem that made my loose several hours searching for the problem, while the solution was quite simple.

## Situation
I was working on an application that uses two [static libraries](http://en.wikipedia.org/wiki/Static_library), or so called archives. My application uses functions from one library, while that library uses functions from another library. This situation sound complex, but I'll explain using an example.

## Example
The application `helloWorld.app` uses two archives `libArchive1.a` and `libArchive2.a`.

### libArchive1.a
This first archive is build from:
`libArchive1/libArchive1.h`
{% highlight c %}
#include <string>
std::string GetHello();
{% endhighlight %}

`libArchive1/libArchive1.c`
{% highlight c %}
#include "libArchive1.h"
std::string GetHello() { return std::string("Hello "); }
{% endhighlight %}

You can compile these files to an archive using these 2 commands:
{% highlight bash %}
g++ -c libArchive1/libArchive1.c -o libArchive1/libArchive1.o
ar rcs libArchive1/libArchive1.a libArchive1/libArchive1.o
{% endhighlight %}

### libArchive2.a
Similar library to `libArchive1.a` with use of the `GetHello()` function:
`libArchive2/libArchive2.h`
{% highlight c %}
#include "libArchive1.h"
std::string GetHelloWorld();
{% endhighlight %}

`libArchive2/libArchive2.c`
{% highlight c %}
#include "libArchive2.h"
std::string GetHelloWorld() { return GetHello() + std::string("World!\n"); }
{% endhighlight %}

Compile by:
{% highlight bash %}
g++ -c libArchive2/libArchive2.c -IlibArchive1 -o libArchive2/libArchive2.o
ar rcs libArchive2/libArchive2.a libArchive2/libArchive2.o
{% endhighlight %}

This will require to provide the parameter `-I` so the compiler knows where to get the file `libArchive1.h`.

### helloWorld.app
Small application printing "Hello World!" to [stdout](http://en.wikipedia.org/wiki/Standard_streams#Standard_output_.28stdout.29) using the `GetHelloWorld()` function.
`printHelloWorld.c`
{% highlight c %}
#include <iostream>         // for cout
#include "libArchive2.h"
int main(int argc, char* argv[]) {
   std::cout << GetHelloWorld();
   return 0;
}
{% endhighlight %}

Now here is where the problem did arise, compiling the application. This is what I did:

{% highlight bash %}
g++ helloWorldApp/printHelloWorld.c -IlibArchive1 -IlibArchive2 -LlibArchive1 -LlibArchive2 -lArchive1 -lArchive2 -o helloWorld.app
{% endhighlight %}

The arguments `-lArchive1` and `-lArchive2` will tell the compiler to link in `libArchive1` and `libArchive1`. But I got the following error:
    undefined reference to GetHello()

After a long search (the application I was working on was a lot more complex, so many things could have been wrong), I found the order of importing libraries with the `-l` argument matter. So after switching the order of `-lArchive1` `-lArchive2`, the application got compiled and did print the text "Hello World!" when running it.

## Conclusion
The order of importing libraries matter. As far as I know it is a [compiler bug](http://gcc.gnu.org/bugzilla/show_bug.cgi?id=6665) and seems to be solved in newer versions (on Mac OSX 10.5 it works, on OpenSUSE 11 the error occurs). Anyhow, if you have problem with this place the least depended library last in the argument list:
{% highlight bash %}
g++ appHelloWorld/printHelloWorld.c -IlibArchive1 -IlibArchive2 -LlibArchive1 -LlibArchive2 -lArchive2 -lArchive1 -o helloWorldApp
{% endhighlight %}

This will sound really technical for a lot of people, but it took me too long solving it to not share it with you. I hope someone will benefit from it.

You can download the source code of this example [here](/content/2009/08/Link2ArchivesInOneApp.zip).

## Further Reading
- [The C Book - Linkage](http://publications.gbdirect.co.uk/c_book/chapter4/linkage.html)
- [Linker order - GCC](http://stackoverflow.com/questions/45135/linker-order-gcc) on stackoverflow.com
