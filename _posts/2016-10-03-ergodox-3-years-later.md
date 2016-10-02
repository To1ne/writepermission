---
layout: post
title: ErgoDox 3 years later
---
This blog post is way over due, but hey, better late than never.

## Massdrop

Back in 2013 I bought the [Truly Ergonomic keyboard][1].
I enjoyed it, most of the time. But it boosted my interest in
mechanical keyboards. And soon I discovered the design of the ErgoDox,
with its open-source design for anyone to grab. Although 3D printing
the case was a turn-down.

Until, I ran into the group buy on [Massdrop](https://www.massdrop.com).
At the time I think it was the second time Massdrop did open the
group buy and I didn't really hesitate to join the _drop_ (on
2013-08-27 to be exact). The fact it came as a DIY kit might scare of
some people, but in my case I was really looking forward to putting it
together myself.

## Assembly

I joined in August, but it took until November before the ErgoDox was
delivered. I was really excited when I received the parts and wanted
to build right a way.

The assembly instructions on [Massdrop][1] are very clear and easy to
follow. I had chosen to use the surface mount diodes instead of
through-hole diodes because I've read the latter would not really fit
inside the case. The first few diodes I did apply where challenging
(also because I haven't been soldering for a while), but fast I got
the hang of it and in the end they all turned out OK.

The other components were quite easy to apply, except for the
micro-USB connector. I did accidentally drop some solder on the
PCB, and I really had trouble to clear the holes. Luckily I had some
colleagues really skilled with a soldering iron to fix this (thanks
Anton!).

I assembled the keyboard in 2 days. On the first day I soldered all
the diodes, resistors, the Teensy and I2C extender. I decided not to
rush things, so I left the switches for the day after. In total, it
took me about 4h to fully assemble it, which I think is OK.

Overall, the assembly was successful (not considering the micro-USB
connector), because all switches were working properly on the first
try. This was a big relief, because I really didn't want to mess up a
$256 keyboard (don't you love that price).

**Note:** For those considering to build your own Ergodox: The DIY
kits [Massdrop sells][2] these days have all the components except the
switches already soldered on the board. The switches are the easiest
to solder, so everyone should be able to build their own ErgoDox.

[1]: https://keyboard-configurator.massdrop.com/ext/ergodox/assembly.php "ErgoDox Keyboard Assembly Instructions on Massdrop"
[2]: https://www.massdrop.com/buy/infinity-ergodox?referer=J5QZFC&mode=guest_open "Infinity ErgoDox Ergonomic Keyboard Kit"

## Cherry MX Blue

I bought the ErgoDox with Cherry MX Blue switches. The TECK I owned
was equipped with Cherry MX Brown switches, and I was really happy
with them. But Massdrop didn't offer Brown switches in their drop. And
because many people were enthusiastic about Blue switches, I decided
to give them a try. Cherry MX Clear switches was another option, but
recently I tried Clear switches on a keyboard of a colleague, and I
really do not like the stiffer spring (actuation force of 55 cN versus
45 cN on Cherry MX Brown and 50 cN on Cherry MX Blue), so I'm happy I
didn't get Clears.

After using Cherry MX Blues for a while, I prefer Brown switches over
Blue switches. Blue switches really sound more clicky and compared to
Brown. The pitch of the Blue sound is higher than the Brown sound and
this makes (IMHO) sound of Brown less distractive.

### Damper rings

In February 2015 I bought me some TEX Cherry MX Rubber O-Rings on
[Massdrop][3]. I've read about damper rings, and they should provide 2
advantages:

 * Lower the volume & pitch of the sound the switches make.
 * Reduce travel: They prevent you from pressing the switch all the
   way down.

Today, I still have the rings applied. It does not make the switches
sound like Brown switches, but it is better.

[3]: https://www.massdrop.com/buy/cherry-mx-rubber-o-rings?referer=J5QZFC "Massdrop Cherry MX Rubber O-Rings group buy"

## Layout

After being used to the TECK, again I had to learn to type on this
keyboard. Massdrop provides a nifty [Configurator][4] to customize the
placement of the keys. It took me several iteration to find a layout I
did like. Some layout changes were really challenging (e.g. like
moving the <kbd>RETURN</kbd> key). But I ended up with [this layout][5].

What I like most about this layout is the symmetrical placement of
the modifier keys: <kbd>Ctrl</kbd>, <kbd>Shift</kbd>, <kbd>Alt</kbd>
and <kbd>Cmd</kbd>. The placement makes it possible to press the
modifier key with one hand, and the letter with the other hand. So to
press <kbd>Ctrl</kbd>+<kbd>a</kbd> I am using my left hand to press
<kbd>a</kbd> and right hand to press <kbd>Ctrl</kbd>.

[4]: https://keyboard-configurator.massdrop.com/ext/ergodox "ErgoDox Layout Configurator"
[5]: https://keyboard-configurator.massdrop.com/ext/ergodox/?referer=J5QZFC&hash=999ad39701e308b79cf7b9409e618d87

### EZ configurator

[ErgoDox EZ][6], manufacturers of completely built ErgoDoxes, recently
released their [configurator][7]. I have migrated [my layout][8] to
their configurator and now I also I have fully functioning media keys
(Volume Up/Down, Play/Pause, Next/Previous).

[6]: http://ergodox-ez.com/ "ErgoDox EZ"
[7]: http://configure.ergodox-ez.com/ "ErgoDox EZ Configurator"
[8]: http://configure.ergodox-ez.com/keyboard_layouts/kraalq "Toon's layout on ErgoDox EZ Configurator"

Recently Ergodox EZ released their configurator

## Thumb keys

I really like the thumb keys on the ErgoDox. The TECK also has some
keys in the center that need to be operated with the thumbs, but they
are too hard to reach them all. The placement of the thumb clusters on
the ErgoDox is much more comfortable.

## Stabilizers

The ErgoDox version I own does not have stabilizers on the 1x2.00 keys
at the thumbs, and that's a shame. They really feel wobbly. I even
have one of the switches that feels more wobbly than the other
three. I think something inside broke, what decreases the stability of
the switch. I probably should replace the switch (luckily Massdrop
ships some spare switches), but I haven't found time for it yet.

**Note:** If you are considering buying an ErgoDox: The new Infinity
ErgoDox sold on Massdrop comes with stabilizers for the thumb keys.

## Conclusion

I love my ErgoDox. It's the best keyboard I own, so far. And I would
highly recommend you buying an ErgoDox because:

 - Open-source design
 - Completely customizable firmware
 - Useful thumb keys
 - Ergonomic split layout

If you consider buying an ErgoDox. I expect soon Massdrop will open a
new drop of the [Ergodox Infinity][9]. I did recently hold the
Infinity ErgoDox, and I like the quality. It is [really cool][10] they
use USB to interconnect the halves.

As alternative, I also heard many good things about
the [ErgoDox EZ][11]. It's the design of the original ErgoDox,
manufacturer by a professional company.

[9]: https://www.massdrop.com/buy/infinity-ergodox?referer=J5QZFC&mode=guest_open "Infinity ErgoDox Ergonomic Keyboard Kit"
[10]: https://input.club/forums/topic/infinity-ergodox-update/#post-692
[11]: http://ergodox-ez.com/ "ErgoDox EZ"
