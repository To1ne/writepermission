---
layout: post
title: More useful space, less annoying advertisements
wordpress_id: 10
wordpress_url: http://blog.tonotdo.com/?p=10
redirect_from: /2009/04/more-useful-space-less-annoying-advertisements
---

## Introduction
In a search for a great webapp I ran into a problem: advertisements reducing the useful space. So I've been searching for a way to remove those advertisements and take full advantage of my screen size.
To do this I've used some Firefox Addons...

## First addons: Stylish (& Firebug)
[Stylish](https://addons.mozilla.org/en-US/firefox/addon/2108) is a Firefox addon which allows to modify the CSS of pages you visit. Actually it makes it possible to add CSS rules to a certain domain or address, but with the `!important` tag it's easy to override styles.
I've used this addon to modify the size/appearance of the `<div>` box which contains advertisement. This way the whole screen could be used by the webapp.
To do this you need to know some CSS code. And a easy way to "debug" the CSS code of a web page is to use [FireBug](https://addons.mozilla.org/en-US/firefox/addon/1843). With this addon you can edit the CSS and see the changes real time on the page. So it is easy to try out the CSS code to make an advertisement disappear. This addon does not store the changes, that's why Stylish is used.

As example I have removed the advertisement sidebar of [Mindomo](http://www.mindomo.com) (a mindmap app which I'm about to review in a future post). And the CSS code looks like this:
{% highlight css %}
@-moz-document domain("mindomo.com") {
   .yui-tmoad #yui-main .yui-b {
      margin-right: 0 !important;
   }
}
{% endhighlight %}
The original `margin-right:` was set to `-13px;` to keep space for the advertisement and with the modification the `#yui-main` uses full page width.

## Second addon: NoScript
[NoScript](https://addons.mozilla.org/en-US/firefox/addon/722) is a Firefox Addon which allows you to block JavaScript on sites you like. The default setting is to block anything except the sites listed in the whitelist. Well, I like to use it the other way: allow anything except sites on a BlackList.
This addon I use to block those annoying [GoogleAds](http://www.googlesyndication.com/), so I've put them on the BlackList. Do this simply by clicking the NoScript icon and selecting "Mark http://www.googlesyndication.com as Untrusted".
That will stop those scripts from displaying those GoogleAds. On most sites this helps a lot, because the `<div>` box size depends on the size of the content. But on some sites these boxes (which are empty) stay on screen and you'll have to remove them with previous addon.

## Conclusion
So you see, it's often easy to remove advertisements. But you'll better don't do it, because they provide the funding to keep the site online. So I don't want to encourage everybody to remove ads, but in some cases it might be usefull.
