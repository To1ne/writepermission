---
layout: post
title: 3 years with the ErgoDox
---

## How it started

Back in 2013 I bought the [Truly Ergonomic keyboard](/2013/07/truly-ergonomic-full-review/).
I enjoyed it, well, most of the time. It was my first mechanical keyboard
and it did boost my interest in mechanical keyboards. And soon I
discovered the ErgoDox. At the time the design was open-sourced at
ergodox.org (no longer online). It was nice everybody could use the
designs to build their own ErgoDox, but you had to 3D-print the case
yourself, which was a major turn-down to me.

Until, I ran into the group buy on [Massdrop](https://www.massdrop.com).
At the time it was the second time Massdrop opened the
group buy and I didn't really hesitate to join the _drop_ (on
2013-08-27 to be exact). The fact it came as a DIY kit might scare of
some people, but I was actually looking forward to putting it
together myself.

## Assembly

I placed my order in August, but it took until November before the
ErgoDox was delivered. I was really excited when I received the parts
and wanted to build it right a way.

The assembly instructions on [Massdrop][1] were very clear and easy to
follow. I had chosen to use the surface mount diodes instead of
through-hole diodes because people on the internet were telling the
latter would not fit inside the case. I haven't been soldering
for a while, so the first few diodes were challenging, but soon
I got the hang of it and in the end they all turned out OK.

[![Soldering the diodes](https://c5.staticflickr.com/1/560/20267552516_739af61ee5_z.jpg)](https://flic.kr/p/wSYvfC)

The other components were quite easy to apply, except for the
mini-USB connector. I accidentally dropped some solder on the
PCB, and really had trouble to clear the holes. Luckily one of my
former colleagues is really skilled with a soldering iron and fixed
this (thanks Anton!).

I assembled the keyboard in 2 days. On the first day I soldered all
the diodes, resistors, the Teensy and I2C extender. I decided not to
rush things, so left the switches for the day after. In total, it
took me about 4h to fully assemble it, which I think is OK.

[![Placing the switches](https://c1.staticflickr.com/8/7310/11072582256_9d1acfee80_z.jpg)](https://flic.kr/p/hSrSWC)

Overall, the assembly was successful (not considering the mini-USB
connector), because all switches were working properly on the first
try. This was a big relief, because I really didn't want to mess up a
$256 keyboard (yes, I paid exactly $0b100000000).

**Note:** For those considering to build your own Ergodox: The DIY
kits [Massdrop sells][2] these days have all the components except the
switches already soldered on the board. The switches are the easiest
to solder, so everyone should be able to build their own ErgoDox.

[![Assembly finished](https://c8.staticflickr.com/4/3670/20299513271_ceee4aa181_z.jpg)](https://flic.kr/p/wVNj58)

[1]: https://keyboard-configurator.massdrop.com/ext/ergodox/assembly.php "ErgoDox Keyboard Assembly Instructions on Massdrop"
[2]: https://www.massdrop.com/buy/infinity-ergodox?referer=J5QZFC&mode=guest_open "Infinity ErgoDox Ergonomic Keyboard Kit"

## Cherry MX Blue

I bought the ErgoDox with Cherry MX Blue switches. The TECK I owned
was equipped with Cherry MX Brown switches, and I was really happy
with them. But Massdrop didn't offer Brown switches in their drop. And
because many people were enthusiastic about Blue switches, I decided
to give them a try. Cherry MX Clear switches was another option, but
recently I tried Clear switches on a keyboard of a colleague, and I
don't really like the stiffer spring (actuation force of 55 cN versus
45 cN on Cherry MX Brown and 50 cN on Cherry MX Blue), so I'm happy I
didn't get Clears.

After using Cherry MX Blues for a while, I still prefer Brown switches
over Blue switches. Blue switches really sound more clicky when
compared to Brown. The pitch of the Blue sound is higher than the
Brown sound and this makes (IMHO) the sound of Brown less distractive.

### Damper rings

In February 2015 I bought me some TEX Cherry MX Rubber O-Rings on
[Massdrop][3]. I've read about damper rings, and they should provide 2
major advantages:

 * Lower the volume & pitch of the sound the switches make.
 * Reduce travel: They prevent you from pressing the switch all the
   way to the bottom.

Today, I still have the rings applied. It does not make the switches
sound like Brown switches, but it is better.

[![Installing dampner rings](https://c2.staticflickr.com/8/7629/16661243809_e906490307_z.jpg)](https://flic.kr/p/roieji0)

[3]: https://www.massdrop.com/buy/cherry-mx-rubber-o-rings?referer=J5QZFC "Massdrop Cherry MX Rubber O-Rings group buy"

## Layout

After being used to the TECK, I had to learn to type on this
keyboard (again). Massdrop provides a nifty [Configurator][4] to
customize the placement of the keys. It took me several iterations to
find a layout I did like. Some layout changes were really challenging
(e.g. like moving the <kbd>RETURN</kbd> key). But I ended up
with [this layout][5].

[![ErgoDox keyboard layout Layer 0](https://c4.staticflickr.com/6/5661/30565031115_ec5ce5c6c9_z.jpg)](https://flic.kr/p/NyVLT6)

What I like most about this layout is the symmetrical placement of
the modifier keys: <kbd>Ctrl</kbd>, <kbd>Shift</kbd>, <kbd>Alt</kbd>
and <kbd>Cmd</kbd>. The placement makes it possible to press the
modifier key with one hand, and the letter with the other hand. So to
press <kbd>Ctrl</kbd>+<kbd>a</kbd> you can use your right hand to press
<kbd>Ctrl</kbd> and your left hand to press <kbd>a</kbd>.

[4]: https://keyboard-configurator.massdrop.com/ext/ergodox "ErgoDox Layout Configurator"
[5]: https://keyboard-configurator.massdrop.com/ext/ergodox/?referer=J5QZFC&hash=999ad39701e308b79cf7b9409e618d87

### EZ configurator

[ErgoDox EZ][6], manufacturers of completely built ErgoDoxes, recently
released a new [configurator][7]. I have migrated [my layout][8] to
their configurator and now the media keys (Volume Up/Down, Play/Pause,
Next/Previous) are fully functioning on macOS.

[6]: http://ergodox-ez.com/ "ErgoDox EZ"
[7]: http://configure.ergodox-ez.com/ "ErgoDox EZ Configurator"
[8]: http://configure.ergodox-ez.com/keyboard_layouts/kraalq "Toon's layout on ErgoDox EZ Configurator"

## Thumb keys

I really like the thumb keys on the ErgoDox. The TECK also has some
keys in the center that need to be operated with the thumbs, but they
are too hard to reach them all. The placement of the thumb clusters on
the ErgoDox is much more comfortable.

## Stabilizers

The ErgoDox version I own does not have stabilizers on the 1x2.00 keys
at the thumbs, and that's a shame. They really feel wobbly. After
about one year of use one of the switches became more wobbly than the
other three. So I replaced the switch (luckily Massdrop shipped some
spare switches) and discovered it was actually broken inside. I hope
the others do not break soon.

![Broken key switch](https://c5.staticflickr.com/6/5069/29800553580_70ed0b264b_z.jpg)

**Note:** If you are considering buying an ErgoDox: The new Infinity
ErgoDox sold on Massdrop comes with stabilizers for the thumb keys.

## Conclusion

I love my ErgoDox. It's the best keyboard I own, so far. And I would
highly recommend you buying an ErgoDox because:

 - Open-source design
 - Completely customizable firmware
 - Columnar key placement
 - Useful thumb keys
 - Ergonomic split layout

If you consider buying an ErgoDox, yesterday Massdrop opened a
new drop of the [Infinity Ergodox][9]. I did recently touched the
Infinity ErgoDox, and I like the quality. It is [really cool][10] they
use USB to interconnect the halves.

As alternative, I've also heard many good things about
the [ErgoDox EZ][11]. It's the design of the original ErgoDox,
manufactured by a professional company.

[9]: https://www.massdrop.com/buy/infinity-ergodox?referer=J5QZFC&mode=guest_open "Infinity ErgoDox Ergonomic Keyboard Kit"
[10]: https://input.club/forums/topic/infinity-ergodox-update/#post-692
[11]: http://ergodox-ez.com/ "ErgoDox EZ"


## What's next

I have pre-ordered a [keyboard.io](https://keyboard.io) and I hope it
will arrive before the end of the year. I am really looking forward to
give it a try.

Other than that, I've also been eyeballing the
[Kinesis Advantage 2][12] for a long time. But with already having
2 (almost 3) keyboards laying around, so I'm not planning to get one
in the near future.
I've been considering to cancel my keyboard.io pre-order and get a
Advantage 2 instead, but it is just too expensive to ship it to
Belgium (about $450 - $500).

[12]: https://www.kinesis-ergo.com/shop/advantage2/ "Kinesis Advantage 2"
