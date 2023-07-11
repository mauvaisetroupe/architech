---
title: Sam Newman - Backends For Frontends
date: 2018-06-21
tags: [Architecture,Patterns]
categories: [English, Article Review]

---

So in practice, our mobile devices will want to make different calls, fewer calls, and will want
to display different (and probably less) data than their desktop counterparts. This means that

we need to add additional functionality to our API backend to support our mobile interfaces.
Another problem with the general-purpose API backend is that they are by definition
providing functionality to multiple, user-facing applications. This means that the single API
backend can become a bottleneck when rolling out new delivery, as so many changes are
trying to be made to the same deployable artifact.


The tendency for the general-purpose API backend to take on multiple responsibilities, and
therefore require lots of work, often results in a team being created specifically to handle this
code base

It could be argued that at this point we have just created a smart-piece of middleware in our
architecture, something which is not focused on any particular business domain - something
which goes against many people's views of what sensible Service Oriented Architecture
should look like.


https://samnewman.io/patterns/architectural/bff/#downstream