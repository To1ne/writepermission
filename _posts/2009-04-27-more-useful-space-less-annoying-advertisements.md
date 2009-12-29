--- 
wordpress_id: 10
layout: post
title: More useful space, less annoying advertisements
wordpress_url: http://blog.tonotdo.com/?p=10
---
<h3>Introduction</h3>
In a search for a great webapp I ran into a problem: advertisements reducing the useful space. So I've been searching for a way to remove those advertisements and take full advantage of my screen size.
To do this I've used some Firefox Addons...

<!--more-->

<h3>First addons: Stylish (& Firebug)</h3>
<a href="https://addons.mozilla.org/en-US/firefox/addon/2108">Stylish</a> is a Firefox addon which allows to modify the CSS of pages you visit. Actually it makes it possible to add CSS rules to a certain domain or address, but with the <code>!important</code> tag it's easy to override styles.
I've used this addon to modify the size/appearance of the <code>&lt;div&gt;</code> box which contains advertisement. This way the whole screen could be used by the webapp.
To do this you need to know some CSS code. And a easy way to "debug" the CSS code of a web page is to use <a href="https://addons.mozilla.org/en-US/firefox/addon/1843">FireBug</a>. With this addon you can edit the CSS and see the changes real time on the page. So it is easy to try out the CSS code to make an advertisement disappear. This addon does not store the changes, that's why Stylish is used.

As example I have removed the advertisement sidebar of <a href="http://www.mindomo.com">Mindomo</a> (a mindmap app which I'm about to review in a future post). And the CSS code looks like this:
<pre lang="css" line="1">
@-moz-document domain("mindomo.com") {
   .yui-tmoad #yui-main .yui-b {
      margin-right: 0 !important;
   }
}
</pre>
The original <code>margin-right:</code> was set to <code>-13px;</code> to keep space for the advertisement and with the modification the <code>#yui-main</code> uses full page width.
<h3>Second addon: NoScript</h3>
<a href="https://addons.mozilla.org/en-US/firefox/addon/722">NoScript </a>is a Firefox Addon which allows you to block JavaScript on sites you like. The default setting is to block anything except the sites listed in the whitelist. Well, I like to use it the other way: allow anything except sites on a BlackList.
This addon I use to block those annoying <a href="http://www.googlesyndication.com/">GoogleAds</a>, so I've put them on the BlackList. Do this simply by clicking the NoScript icon and selecting "Mark http://www.googlesyndication.com as Untrusted".
That will stop those scripts from displaying those GoogleAds. On most sites this helps a lot, because the <code>&lt;div&gt;</code> box size depends on the size of the content. But on some sites these boxes (which are empty) stay on screen and you'll have to remove them with previous addon.
<h3>Conclusion</h3>
So you see, it's often easy to remove advertisements. But you'll better don't do it, because they provide the funding to keep the site online. So I don't want to encourage everybody to remove ads, but in some cases it might be usefull.<!--more-->
