

https://www.youtube.com/watch?v=8hlorSidNFw&t=1541s


## Preambule
Gregor Hohpe: When I was hired as Head of Enterprise Architecture, my first job was actually to standardize things. And what I also didn't know was that that is the most hated person in the whole organization, because the person who's trying to make all the standards is the one telling people what they cannot do. That doesn't enable anybody or speed anybody up. That just makes people's lives more difficult.

So the really important question is, where's the difference? And the difference is in the fact that platforms also harmonize and standardize, but without restricting. By standardizing, they actually enable, they allow people to do more things. So they achieve the opposite of what we traditionally think of as standardization.


## The Architect Alevator

The Architect Elevator came out three years ago, right at the beginning of the pandemic, in 2020. And the idea there was to rethink a little bit what architects should be doing. I mean, there's many opinions about what architecture is and many opinions about what architects should be doing. I think last time we chatted a little bit about that. So the Architect Elevator was trying to take a look that the architects aren't supposed to be the ones who are like the smartest people and tell everybody what to do and make all the decisions. But much rather they're supposed to fill in the gap between the grandiose visions and the reality. Hence, the elevator.

## The strategic books serie

### Cloud Strategy

So the strategy books are meant to be the application of that principle to different domains. Like the domain of cloud computing, where there's a lot of technical resources and a lot of high-level strategy stuff telling you all the things that you should be doing. But there's very little in between, like, how do I get from here to there?

### Platform Strategy

And platform strategy is, again, looking to do the same thing for platforms, which has become a very hot buzzword. But again, you ask three different people, you get four points of view. So I'm trying to get a better definition of what is a platform, what really makes a platform, how do you go about building one, and filling in that gap. That's indeed intended to be a series.

## Definition of Platform

### Car Manufacturer analogy

Gregor Hohpe: It's probably good to state first that the whole idea isn't that new at all. Like one sort of thing we suffer from collectively is we always believe that we invent everything. And we, we mean like the software people, right? The computer people, like how sometimes I'm called by my older relatives. We always feel like we invent everything. The platform idea isn't actually that new. And, you know, some of the popular examples are automotive platforms, right? The car manufacturers, long time ago, realize that making a new engine and brakes and transmission and everything for each car model is actually not a great idea. It's very expensive. And in the end, the people don't really just buy the car exactly because of the brakes that are in that car. So they started making platforms and putting different car models on top of a common platform.

### operating Systems are platforms

So the idea has been around for a long time. And if we look at the IT side, operating systems are also kind of platform, right? They abstract away, in this case it's not the engine and transmissions, but it's sort of the disk encoding and interfaces and all the hardware stuff, right? They abstract away. And then on top, you can build many, many different things on common hardware without having to deal with all the details.

So that idea has been around for quite some time. Where I think it's gotten a huge boost recently, interestingly, it comes from multiple angles.

### Business Platform

One is the platform business models, like platform companies, like the Airbnbs and the eBays of the world, where people say, hey, it's a multi-sided marketplace, right? You have sellers and buyers. And interestingly, that platform company itself often doesn't even hold inventory. Like Amazon does, for example, now they ship physical products. But an Airbnb doesn't own any hotel room, and that has become known as a platform. So that gave a huge booster, and these are the Ubers, the Airbnbs of the world, the mega unicorns and now some of the most valuable companies that we have.

### Cloud platforms.

It's actually kind of funny, like the GCP folks, the P obviously has the word platform in the name. The funny thing is on AWS, we don't like to use the word platform. So here, today, I'm here as myself so I can joke about it. So it's kind of funny like where some people embrace the word and other people kind of shy away from it. But the reality is most clouds are platforms in a way, right? They give you a common layer that you can put many things on top of and they abstract the things underneath.


### In-house Developper platform

And then, so that also everybody is doing these days and then, if that wasn't enough, what everybody else also seems to be doing these days is making developer platforms. In-house platforms. They're called productivity platforms or IDPs, internal developer platforms. Again, we can't even agree on the acronym. And the idea is there to layer something on top of the base platform like on top of the cloud to make it easier to use for developers or to increase their productivity or to have some form of governance, right? It can also be to restrict.

### Platform, IT service, Framework, Abstaction Layer, Governance tool ?

Now, with the three different use cases, and, as I just hinted, people having different objectives, right? Some people want to make development faster, other people want to restrict what people can do. You can easily imagine that it's no longer that easy to look at something and say, oh, is this now a platform, or is this just like an IT service, or a framework, or an abstraction layer, or a governance tool?

### Platform Benefits

Henry Suryawirawan: Right. So even after I heard you explaining it, right? So there are so many permutations and variables that could happen, right? To me, when I always heard about platform, it's about reusability, right? It's about unification or standardization of stuff. Maybe if you can elaborate, maybe you have mentioned just now a few other benefits, right? What are some of the benefits of a platform truly, right? Because for people to really understand that it is a platform, right? They need to understand, okay, there are benefits of using the platform.


Gregor Hohpe: Yes. And what I would say for the rest of our discussion, it will help if we leave the Ubers and Airbnbs, if we leave the multi-sided markets and all those aside, because they share some commonalities, but they are also very different from the platforms that we as engineers would normally build and use.

So, if you look inside organization, cloud platforms, engineering productivity platforms, your question is a very good one. And I think you hinted at the keywords like sort of the standards, standardization, reuse, right? Those are the things that people want from these platforms, but this is not the first time we want reuse or standardization.


I worked in large enterprises and some people might know my joke when I was hired as Head of Enterprise Architecture. I didn't really know what enterprise architecture was. It just sounded good, and my first job was actually to standardize things. And what I also didn't know was that that is the most hated person in the whole organization, because the person who's trying to make all the standards is the one telling people what they cannot do. They're like, oh, we want to build something on this database or use this programming language or this framework or this app server. And then the standards person comes with a enterprise architect title and says, no, no, no, you cannot use that database. You can only use that database. So that is obviously not a platform, right? That doesn't enable anybody or speed anybody up. That just makes people's lives more difficult.

####  HTTP 

So the really important question is, where's the difference? And the difference is in the fact that platforms also harmonize and standardize, but without restricting. By standardizing, they actually enable, they allow people to do more things. So they achieve the opposite of what we traditionally think of as standardization.

Now, the question is like, oh, that sounds a little magical, right? How can it restrict? Like, how can it standardize, but at the same time allow more innovation? And the key mechanism there is that not all standards are created equal.

A great example that we have that has the same property is HTTP, right? HTTP is a standard. I mean, it goes through all the different incarnations and versions, but it's a very well spec'd out, very strict standard, and we all use it. So in a way, it constrains us. If you say, hey, I invented this other great protocol that I want to use, ah, probably uphill battle. People will say, hold on, why are you not using HTTP? It's the standard.

But we can see that HTTP has been a huge innovation booster, right? Without HTTP, we wouldn't have the cloud and all the other stuff. So that shows that you can sort of rewrite the laws of physics a little bit, where in the past, it was always that, you know, if I take choice away, then people can't be creative.


But now, we have ways where we also take some choice away in a way, but it actually allows people to do more things and more creative things.

#### Cloud platforms

Cloud platforms, you know, I'm using the P word here. The cloud platforms also have that property, right. I often remind people, you know, I talk to a lot of customers at my day job. And if the meeting is a little bit boring, or I want to sort of poke the box a little bit, I say, listen, people, we have a single product, basically, right? There's, you know, many, many services, but basically there's one AWS, right. There's no red, green, or blue AWS, right? And same with GCP, Azure, right? It's like, it's basically one thing that these companies have. And I say, the AWS you're getting is the same AWS, essentially, that your competitor is getting. And people go like, oh, how can this be, right? So, yes, it's a standardized platform, but what people do on top, it's nothing short of magical, right? I mean, people do all sorts of amazing things. So, what I'm trying to get at with the book is like, tease out a little bit. Oh, why is the one standard thing the most hated activity and constraining people? And why is with platforms that doing the opposite? And how can you recreate that.


What are the essential properties
that make that magical thing happen?

Henry Suryawirawan: Yeah, when
you explain about this, I think

that's the insights for me, right?

So, people want to standardize, but
they are more towards restricting.

Actually, also restricting the kind of
capability that people do with whatever

they're building as a standard, right?

So I think in your explanation
just now, the platform, yes,

will create some restriction.

But the benefit is actually to enable
people to do more stuff, more creative

stuff, and even could be faster,
it could be more creativity, more

innovations, and things like that.

But it seems like a very, very tall
order for many, many people, right?

And that's why probably you have
this thing called strategy, right?

Platform strategy.

So tell us, why do people need
to build some kind of a platform

strategy before they embark on
building platform or using platform?

Gregor Hohpe: Yeah, so the reason is
that you need to be cautious, is A,

like as we already discussed, right?

It's kind of a subtle but magical
property, which isn't easy to create.

So it's very tempting to set
out to make a platform, right?

But if you don't really get the
nuances of it, you just might be

building another IT services layer.

And I actually have a chapter in
the book which is called Platform

and IT services are antonyms.

They're like the opposite of each other.

And what can easily happen in large
organizations where I used to work

and where many of my customers are,
there's always the temptation to

take what you have, and sort of
apply the new label to it, right?

And it's understandable because you
don't want to throw everything away.

And you have shared services or maybe
even have a private cloud, some virtual

machines, some ticketing system, maybe
even some self service portal, right?

You have all these things and then
you're like, oh, that's actually

most of what I need for a platform.

Let me just make that into a platform.

And unfortunately, most of the
time that goes completely wrong.

Because these things
were built for control.

They were not built for driving
innovation and enable the

diversity that you mentioned.

And that's sort of the first important
part of the strategy is to tell

you how different this actually
is and make this very obvious.

Like, I have these
side-by-side comparisons.

The stuff that you had before
in a successful platform is

almost the exact opposite.

So I want people to not under
estimate what they're signing up for.

And I also want to give
them some simple tests.

Like you mentioned before, you
like reading the books, because

they're sort of, you know,
not entertaining, I would say.

We're not in the movie business
here, but I would say they're

engaging in a way, right?

They're accessible, but at the
same time have serious content.

So what I'm trying to do is capture
this kind of advice in something that's

memorable and easy to understand.

So one of the tests I'm suggesting is
if you build a platform, people should

do something on top that surprises you.

Like, if nobody does anything
with your platform that generally

surprises you, then you probably
didn't make a platform, right?

If you try to anticipate everything that
people will do, it sounds very useful,

because if you anticipate everything,
you can make great reuse, right?

You can provide exactly what
everybody wanted, but you failed to

make a platform because you didn't
create this multiplier effect.

You didn't make this innovation booster.

So I'm trying to distill it down to these
kind of tests that when people look at

what they're proposing and saying, is
this really allowing people to build

something that we didn't even think of?

And if the answer is, oh, not really.

We just wanted to give them some
common services, then probably that's

an early indication that the platform
strategy needs a little bit of revising.

Henry Suryawirawan: Yeah, I think the
metaphor that you use is like standing

on top of the giant shoulder, right?

If you want to reach a higher
height, you can, you know, climb

the ladder and things like that.

But you can also stand on
top of a platform, right?

Or standing on the top
of the giant shoulder.

And in this case here, right,
your metaphor about a platform

versus IT service, I think is
very, very interesting for me.

Because some people, when I
see real life example of people

building platform, right.

Most of them, I see it now becoming
like an IT service instead of platform.

Maybe if you can bring up some attributes
that you see are the antonyms between

platform and IT services, I think
that will also be useful for people.

Gregor Hohpe: Yeah, yeah, and
it's interesting that you also see

that it's a super slippery slope.

And we see a similar effect.

You know, obviously I work with
a lot of customers migrating to

the cloud, adopting cloud service.

And the failure mode, unfortunately,
is always relatively similar.

Like, people look at anything that's
the bottom layer of a picture, right?

We always have this mental picture of,
on the top is application development and

there's other stuff underneath, right?

And underneath can be IT services, it can
be the cloud, or it can be a platform.

So when we look at the organization,
we're like, ah, there's the application

teams there, and then this stuff is with
the teams that do the bottom half, right?

Now, that makes some sense because
the folks who do the bottom half,

they're used to provisioning
services, doing operations, right?

They have some really valuable
skills in this area, but they work

in a very, very different model.

Like, in a way, they're the
best guys for this, but they're

also the worst people for this.

Because they have the technical skill
in many cases, but they absolutely don't

have the mindset or the way of working.

And that's where this comes from,
where both cloud initiatives or cloud

transformations, like we like to call
it, and platform initiatives, they

struggle or completely fizzle out.

Because basically the teams who
are running them are not used

to this way of working at all.

So the way this shows up in many
cases, and this is where I made this

comparison table, is that IT services
are often not full self service, right?

So you fill out some ticket or
some, I used to fill out Excel

spreadsheets to get a server, right?

That's not how platforms work.

Platforms are easy to get onto.

Platforms live from scale.

You want many people to use the platform.

In a classic IT services, everybody comes
and wants something, you're probably

overloaded and you become the bottleneck.

So you can see from these examples,
it's exactly the opposite.

One is built for control, the other
one is built for ease of onboarding.

One is for ticketing semi manual, the
other one is complete self service.

The old model is based on the idea
that the IT service is responsible

for all the non functional aspects.

Yeah, like all the scalability
and security that's supposed to

be done all in a bottom layer.

The new model, the platform model
is a shared responsibility model.

If your application is super brittle
and leaky and full of vulnerabilities,

no platform is going to tell you that
it's magically going to fix that.

So the division between the
two teams is very different.

Also, maybe last example,
and the list goes on, right?

But last example is that the
digital IT services like stability.

Because they have learned that
through stability, they get

uptime and those known functional
requirements that they're responsible

for, so they don't like to change.

While successful platforms
change all the time.

I mean look at the cloud platforms, right?

AWS used to have like two
or three services, right?

It was like EC2, S3, SQS, right, and then
it's like a couple of hundred now, right?

And the other one's no different, right?

So every year there's a lot
of new features, new things.

Open source projects for platforms
add features all the time.

So platforms are based on evolution.

And that's good, because, as
the platform grows, it lifts

up everything else with it.

So you get new capabilities,
basically, without doing much.

And again, that's the exact
opposite of the IT services because

they always favor stability.

So it's almost every way you
look at it, it's the opposite.

Or IT services are
generally mandated, right?

There's a mandate, oh, you cannot do
anything if you don't use our service.

Most successful platforms
are not mandated.

It's not 100%, but in most
cases, it's voluntary.

So again, it's the opposite.

So what I wanted to do in the book is,
really, I don't like black and white

painting, because I always say for
architects, everything is a trade off.

But in this case, I think a little
bit black and white is helpful to

really show you that it is totally
the opposite of one another.

Henry Suryawirawan: Yeah.

And I think you sum it up
also in one statement, right?

Platform thrives with scale, right?

So if you don't see some kind of
a scale where people build more

solutions, more adoptions, more usage.

And even they recommend
it to other people, right?

I think that's not like
a true platform, right?

Because that could be just some
IT services that you mandate

people to use for control, for
standardization, or for whatever that is.

Gregor Hohpe: Correct.

And in some sense, that already
presents a little bit of a challenge

for in-house platforms, right?

If platforms thrive on scale, if you
build something custom in-house, you

will never have the scale that, let's
say, a cloud provider would have, right.

So you need to be cautious.

Now, the good news is that you can build
on top of a platform, so your platform

doesn't have to start from scratch.

So that helps a little bit.

But you're absolutely right.

There's a couple of important
mechanisms at work here.

The one thing is, platforms
are indirect value creators.

If you build world's most beautiful
platform and nobody is on that

platform, the value creation
is absolutely zero, right?

Like the thing doesn't
do anything on its own.

It enables developers.

It speeds them up.

It helps them make fewer mistakes,
build better applications, like there's

a million ways to sort of position it.

But the value only comes with the usage.

And that means, right, the scale is where
the value is, versus traditional IT,

they often suffer from their own success.

I see this with cloud
centers of excellence.

So as a quick side note, they're
also candidates to be relabeled

as platform teams, right?

As we look around, it's either the
IT service teams or in a slightly

more modern organization, the CCOE,
the cloud center of excellence, that

gets relabeled as platform team.

And if that is super popular
and it scales, they usually

become a bottleneck, right?

So it thrives on scale because that's
the only way it can generate value.

And the other magical maneuver
that platforms do, and this is

visible with cloud platforms.

Cloud platforms are a
scale business, right?

Building these data centers,
these like billions and billions

of dollar data center, undersea
cables, like this infrastructure.

That is clearly in economies
of scale model, right?

The bigger you are, right, like you
can make those kind of investments.

Custom CPUs, right?

Like almost every cloud provider,
whether it's Graviton or Titan

chips or whatever you have, right?

Almost everybody has
custom hardware these days.

Those are not things you can
do as an average enterprise.

So there's a clear scale effect.

But the magic of those platforms
is that the usage of these

platforms is not a scale effect.

Like I can run one lambda function
for like one second, right?

And pay, I could do the math, but pay
some ridiculously small amount, like

a fraction of a penny on it, right?

Or I can get an EC2 instance
for one hour, right?

And pay like 50 cents for it.

So the magic of the cloud platforms
has been that they use economies

of scale underneath, because that's
the only way to make these things.

But they're offered as what
I call economies of speed.

You can have it instantly, you
can get as little or as much as

you want, you can shut it off.

So they changed the rules of
engagement between the usage of the

platform and the implementation.

Now, for cloud platforms,
we kind of knew that.

And probably, if my memory was better,
in Cloud Strategy book probably it says

something like this about cloud platforms.

What I'm trying to do with platform
strategy is to take a step back and say,

now is that just for cloud or is this
for all platforms, and how can you as

a platform team make that work for you?

So in a way, the platform book is
sort of one more level of abstraction

over the cloud book, in some sense.

Henry Suryawirawan: Right.

You bring a topic, cloud
center of excellence.

So in my experience, I've
seen people building platforms

on top of cloud platforms.

Like you mentioned we can build
platform on top of base platform, right?

In this case, it's cloud platform.

Especially if you want to go hybrid,
multi cloud, or especially if you

don't want to expose people to the
real cloud console, for example.

So tell us a little bit
more about this strategy.

How do you think people should do it?

Because so many people are doing it.

How should they do it so that it becomes
more successful for the organization

rather than limiting people with options?

Gregor Hohpe: Yeah, and I would say
the sad reality, there are maybe more

poor examples than good examples.

I think we are slowly learning.

And there's few companies now that
basically platform builder toolkits

to make it easier to build platforms.

But the harsh reality is that making
such a platform that you layer on top

of the cloud is extremely difficult
for a number of different reasons.

Well, the one reason I already
mentioned, right, the platform

that you're building on evolves.

So you might be building something that,
in a year or so, the base platform does.

That doesn't mean it's a bad thing,
and actually, this happened to me

when I was in financial services.

I built an in-house platform, and
then quite a few years later, somebody

came like, hey, you know, all this
stuff you built, they replaced it

all with like, AWS or something.

And they thought I would
be very sad about it.

I'm like, oh, that's great.

Because that means we were exactly
on the right trajectory, right?

We were a few years ahead with
our specific needs and now

the base platform does it.

So I should throw away what I built
and just use the base platform, because

you will always have better economics.

But that takes a very
different mindset, right?

You must be happy when your
things become obsolete, which

is not the way normal IT works.

They would always think
about cost recovery.

They're like, oh, no, no, this thing
needs to live as long as possible,

because we need to get our money back.

So this is one way in which
these platforms struggle.

The other one, and there's a magical
word here, which is, I think very

useful but also very difficult,
and that's the cognitive load.

So, almost all of this, from the team
topologies, right, you know, Matt

and Manuel, you know, written a book,
super popular, very helpful models.

I'm pretty sure they were on
Tech Lead podcast at some point.

So they introduced the
notion of a platform team.

Now careful: platform team and
platform still two different things.

And there's one unfinished chapter
in the book, which is actually called

Platform Team Without Platform.

But basically, the team topologies really
focus on the concept of cognitive load.

And that's important, because if you
look at today's development teams, right?

There's one maneuver that we've
executed over the last couple of

years, and that's called shift left.

Basically, oh, security should be shifted
left, operations should be shifted

left, policy and compliance should be
shifted left, policy as code, right?

Now we have DevSecOps, DevArcSecOps,
basically, you build it, you run it.

So basically, everything is piled into
the development team, so I no longer

call it shift left, I call it pile left,
because everything gets piled over and

people basically going bananas, right?

So if we don't manage to reduce
their cognitive load, there's like

no way you can have such a team that
can do all these kind of things.

So the idea is extremely valuable.

Now, the reason I mention it's also
a bit of a dangerous word is that

it's used to justify everything.

So people say like, oh, we don't want
you to use the native cloud services

because we want to be portable or
we don't want you to use this region

and we want to fix this parameter.

And they say, look, it's good for you
because it reduces your cognitive load.

And that is not true.

So let's take a very simple example.

Let's say you have a cloud service
and it has 20 different parameters.

And you as a platform team,
with good intentions, you say, I

default 10 of those 20 parameters.

So the developer only has to
now worry about 10 parameters.

That on the surface would seem, hey,
setting 10 parameters is easier than 20.

Didn't the cognitive load go down by 50%?

The reality is, no.

Because behind these
parameters sit concepts.

So if you fix the availability
zone, that's probably fine, right?

People don't need to worry about
it unless they need to do something

across availability zones, right?

Even then you struggle, because like, oh,
I never actually knew what an availability

zone is because they were set for me.

Now somebody says I need four nines
or five nines, so I need to run

across multiple availability zones.

What is that?

So it's not that easy.

Also, depending which parameters you
fix, not all parameters are independent.

You might create some sort of
intellectual minefield where you sort

of take some concepts out of the overall
construct, and sometimes needing to

understand a half a thing is harder
than understanding the whole thing.

Because if you see the whole thing, you
can understand what relates to what and

what combinations are useful, versus if
I sort of randomly take some pieces out

of the puzzle, it's actually harder.

I mean, maybe, a metaphor
is, and it reminds me of the

funny movie, The Accountant.

I blogged before about transformations
and not hiring a hitman to fix your

stuff, which the movie is partly about.

But it has a example where somebody tries
to put together a puzzle and the kid is

autistic, so one piece is missing, so
he is very unhappy and very agitated.

But that metaphor just
came to my head, right?

Let's say you give somebody a
puzzle of a thousand pieces.

And you say, hey, I want to
make this easier for you, so

I took away half the pieces.

It's worse, right?

Because you don't know
if the piece is there.

If it isn't, like in the end, you
don't know which ones are missing.

You would need to give people a different
puzzle with 500 pieces that fit together.

You can't just take out half the
pieces from the puzzle, because

you just make it harder for people.

So that's where the book is trying to go.

And it's a little bit, it
sounds kind of maybe abstract.

But that's where I see a lot
of these initiatives derail.

They say, hey, I take some
things away from you, doesn't

that make your life easier?

And the short answer
is no, not necessarily.

Henry Suryawirawan: Yeah, in your book,
you also bring up an example, where,

for example, some of these parameters
are hidden and they are applied in

the actual instance, for example.

And then there is an issue, like,
when you troubleshoot, you see an

error message, but the root cause is
mentioning something that you didn't

even know that you tweaked before, right?

So you kind of like, limit
people to understand what is

going on and even troubleshoot.

And you need to file tickets,
support, and things like that,

and things become slower.

So I think this is also another
danger zone that I read from

reading your book, right?

So I think that's really,
really good advice for people

who are building platforms.

Another thing, I think when you
build this in-house platform,

you need to have skillset, right?

So any tips here for people,
how they should find skillset?

And how they should think about
finding people who can build a

truly developer-friendly platform?

Gregor Hohpe: Yeah.

Perfect question.

Ironically, this is another
common failure mode.

So I'm a little bit worried that we may
be painting the picture too darkly here

about all the things that can go wrong.

But in the end, a good strategy is
intended to keep you on the good

path and keep you out of trouble.

So I think mentioning and talking about
failure scenarios is actually very common.

So here's a failure scenario I've seen.

Almost every large organization
doesn't have enough fully skilled

developers as they would like, right?

And that's always going
to be the case, right?

Because there's a lot of
stuff to do, you know, modern

applications are demanding, right?

They're distributed.

We have fine grained deployment
models, automation, right?

We release often.

Like we can do amazingly cool stuff
but it's not exactly trivial, right?

So there will always be
a shortage of skillset.

So what these companies, they do is like,
okay, if I have a lot of developers which

are so-so, can I pick good developers
and make a platform so that the so-so

developers become good developers?

And funnily, Martin Fowler,
I think, commented on this.

Wow, it must have been a decade
or two ago, because that same

mistake was made with frameworks.

But it's like, oh, instead of a platform,
I build a framework, right, where all the

good developers build the framework and
then the not so good developers become now

good developers, thanks to the framework.

And that basically has never worked.

So the failure scenario is that
you also don't have the skills to

build a platform, because the bar
for that skill is much, much higher.

And I'll give some example
in different ways in which

the bar is much, much higher.

The one thing is, so let's start with
the what's perceived as the easier one,

but usually the harder one, and that
is how does a platform team function?

Like how does it engage
with customers, right?

How does it take feedback?

What is the rate of change?

We said platforms must evolve, but if they
change every day, nobody will be happy.

You can go and ask your customers
what they want, but building what

your customers say they want is also
not a great way to build a platform.

So there's a lot of skills there
in terms of, it's like running

a successful product company.

A lot of trade offs,
prioritization, right?

And that is something very different,
especially in IT operations, right?

Where basically, here's the free
service you can have, please be happy.

This is again the exact opposite where
you need to be customer centric, do

a lot of product management, do a lot
of marketing, a lot of consulting.

So that skill you need to have.

And the technical skill you need to
really have is to really understand

cognitive load and abstraction.

So if defaulting half the
parameters doesn't reduce the

cognitive load, what actually does?

And I see people struggle with this a lot.

So my favorite example is, so people
look at the different cloud providers

and say, oh, there's, you know, SQS, you
know, I'm a queuing messaging guy, so I

must make an example from message queues.

So you have like SQS, right?

You have the Azure Event Bus.

You have Google Pub/Sub, right?

So when they say, aha, I make
an abstraction and I call that

abstraction message queue.

But in the end, you didn't
really abstract much.

It was already a message queue
before you abstracted it.

Maybe it had some
specific runtime settings.

But two things come into play.

You didn't really simplify things
that much because it's still a queue.

It's asynchronous.

You need to deal with things like
back pressure and time to live, right?

Like all that stuff doesn't go away.

And to be honest, the original queues
probably have some really important

settings underneath like FIFO or not FIFO,
on scale out and many other things that if

you take those away, again, you have the
puzzle where half the pieces are missing.

So I see even talented
teams struggle with this.

They say oh, but I made
this abstraction layer.

But you didn't actually
abstract something.

So what I've seen from some customers
where they are really successful

at this and have a much better
approach is they start taking

concepts from their business domain.

It was really interesting.

I talked to a customer like
about a month ago and they

described what they were doing.

And then I was really excited
because I liked it so much.

And their comment was, oh, finally,
somebody who understands what we're

doing because they couldn't find
anybody to appreciate what they had

done because it was very subtle.

But for me, it was absolutely
obvious and ingenious.

So rather than trying to abstract
SQS into a queue, they have concepts

that are important in their, what I
would call business technical domain.

So they are financial services
companies, so they have a lot

of compliance requirements.

So they need to have ledgers.

So when you have a database, you
can make updates in the database,

but every change must be tracked in
a log or a ledger they call, right?

That's the way the industry functions.

You can't just like go and change the
number in the bank account, you add and

subtract money and that gets all logged.

So that is something that's very
inherent to their business and

their business technical domain.

So their platform now
has constructs like this.

They have ledgered database and underneath
is DynamoDB and EventBridge Pipes and

another DynamoDB, the way they do that.

But they didn't call this, like,
two DynamoDBs and EventBridge pipes,

or a queue, or whatever, right?

They called this a ledgered database.

And the difference is very subtle.

You could even make an abstraction
that's called database with customer

data and database without customer data.

Or database with PII, like personally
identifiable information, or without.

And to most people, that
would seem very subtle.

Huh, it's still a database.

And again, you're probably just
defaulting a few fields, right.

Because maybe the PII database needs
to be encrypted or in a special

availability zone in a special region.

You're like, oh, you're
just defaulting fields.

No.

In this case, you're not just
defaulting fields, you're building

a new domain language on top of it.

So, the second skill that you really
need to have is you need to be able

to do domain modeling, DDD, really
domain driven design, but for this

business technical layer, right?

It's half cloud and technical stuff.

You talk about databases, right?

That's obviously technical stuff,
but with a strong business flavor.

Does it have PII?

Does it need to be ledgered?

And I think that is a skill
we still struggle with.

And the techies will dismiss
it as too fluffy stuff.

They're like, oh, it's still a database,
like whatever, what are you talking about.

And the business people don't necessarily
have the skill to really understand

like DynamoDB and EventBridge and
pipes and all the other things.

So you're living right in that area
which I find super fascinating.

But I've seen it very rarely
that that is done well.

And that touches on sort of how it
can be done well, but it also touches

on why so many things fail by just
saying, hey, I abstract SQS into

a queue or I default some fields.

And all that sounds nice, but it's not
reducing cognitive load and it's not

giving you the abstractions that you need.

Henry Suryawirawan: Wow, I think
that's a pretty good insight, right?

The example when you mentioned they
created their own concept, like a

business technical domain concept, right?

But I think that is
really insightful for me.

And when you mentioned about
creating abstraction, right?

I also love the metaphor you
introduced in the book, right?

Abstraction, not an illusion.

So sometimes we create abstraction,
but actually it's an illusion.

Right?

It doesn't actually abstract away things.

We create such that it becomes like a
unified interface, but the implementation

details can be so, so different, right?

Between, for example, different queue
mechanism from different clouds, right?

And people will be stuck like,
because yeah, because they

think it's an abstraction,
but the behavior is different.

So I think this is also
another danger zone.

Gregor Hohpe: Just picking
on that really quickly.

So yeah that happens if people
want to abstract too much.

They say, oh, I make this
beautiful logical abstraction.

Now I have this queue, this generic queue,
but it turns out any distributed system

has a lot of physical properties, right?

And no logical layer can abstract
away physical properties, right?

And Joel Spolsky, right, always, you
know, never short of an opinion, right?

He said all abstractions are leaky.

And that's probably true, I would say.

The leakiness isn't that horrible, right?

So for example, I don't mind if my queue
thing has an SQS setting on it That's not

what's making my day good or a bad day.

But what leaks through is the
physical aspect: latency, failures,

retries, queues filling up, all those
kind of things and an abstraction

layer cannot make that go away.

And that's where, you know, I work at
serverless, as I said in the beginning,

that is full of that stuff, right?

Because serverless solutions, they're
fine-grained, asynchronous, event driven.

So the physical properties
are extremely important.

And then people try to
make it look very simple.

And simple doesn't always
mean better abstraction.

So the classic example is RPC.

RPC is also a beautiful
abstraction, except it doesn't work.

It pretends to be something that it
isn't, because it pretends that there's

no latency, there's no partial failure.

It pretends you have a call stack, right?

It pretends it's always consistent.

It pretends the eight fallacies
of networks don't exist, right?

Or distributed computing.

Basically it pretends all these things
that are not true and that is the

classic example of you build an illusion.

So what we learn is it's not about
taking as many things away as possible.

It's about finding sort of the right level
where you can create a new mental model

or a new domain, like a new vocabulary for
people that's cohesive in itself, right?

And that is in the end, it
is domain driven design.

And that in the end, is quite challenging.

So when people say, oh, we're going
to build some platform, we have

some servers and some cloud stuff,
we're going to go build a platform.

I kind of want them to read maybe, well,
ideally read the book first, but whichever

way you do, think a little bit more first
about what are you really achieving?

And are those really abstractions?

Are you really reducing cognitive load?

We use all these words
way too loosely, right?

Like, everybody talks about this stuff.

But then really making it work
is a whole different story.

So, yeah, hence the illusions.

Henry Suryawirawan: Right.

I'd like to bring another metaphor
that you bring in the book, right?

Because we have been talking about, you
know, building a lot of components, a

lot of cohesion, and things like that.

You have this analogy, fruit
salad versus fruit basket.

So I think this is a fun one.

So if you can elaborate a little
bit more for us to learn from.

Gregor Hohpe: Yes, and this fits exactly
what I was trying to say earlier, right?

I like to take metaphors from real life.

Like, one of my most popular
articles is still the Starbucks does

not use two phase commit, right?

It's like, it's very memorable,
but it has a serious meaning.

And this one has also meaning.

And interestingly, this
was the very first chapter.

This came out of my work at the Government
of Singapore, when I worked for GovTech,

where we were actually building an
engineering productivity platform,

and we had to make design decisions.

So one question was, Confluence
and Jira and a few other tools, is

that a developer platform, right?

Because, okay, whichever flavor
you prefer, but let's say you have

a ticketing system, a source code
repository, a build pipeline, right?

Isn't that making a
great developer platform?

Because it gives the developers
all the things to be productive.

And then I was saying, yes, that's useful,
but I coined that the fruit basket.

Basically, assuming the different systems,
you know, like basically, the wiki and

the backlog management systems, right?

And your code repository and your
build pipeline, they're like the fruit.

And now you put this fruit into a
basket and that's bundled together.

It's convenient.

But it doesn't have, like, the
sum of the fruit is not bigger

than the individual fruit, right?

You put four fruit in a basket, that
thing is a basket with four fruits.

So the whole isn't greater than
the sum of the parts, right?

The whole is equal to
the sum of the parts.

It's a basket with four fruits.

And, in real life, we
know the counterexample.

We know the counterexample of fruit salad.

Now, again, it seems trivial, because
it's also like fruit in it, but it

opens up entirely new use cases.

You don't need tools, you don't need to
peel anything, you don't need a knife.

It's easy to take to a picnic.

It's easy to make a mixture
that otherwise you cannot do.

If you want to make a fruit basket and
one of your fruit is a watermelon or a

jackfruit, to make it worse, right, you're
going to struggle to balance that out.

Well, in a fruit salad, that is no
problem because you control the mixture.

And what I remind people is the per kilo
price of fruit salad is routinely two

to three times higher than the fruit,
because it has a higher value proposition.

So what we learn is like, yes, fruit
basket is an okay way to start.

You bundle some things together.

But don't believe everybody will be
jumping up and down at your fantastic

platform, because you didn't really
create a whole, you didn't create anything

cohesive, you just bundled a few things.

Maybe you share some accounts or
something, but really you didn't put

anything much on top, you just bundled.

So you composed some things, but
you didn't abstract anything.

So I always nudge people, think
about can you make a fruit salad?

And I talked to one customer where folks
told me after our meeting, they changed

their title to Fruit Salad Maker because
they're building an in-house platform

and they kept trying to explain to people
that sort of, you know, just like Jira

and Confluence and a few other things
don't make a really good platform, but

he had a hard time articulating that.

So he was so happy he said fruit salad.

So wherever he goes is we need
fruit salad, not fruit basket.

And that obviously makes me happy,
because it means these lighthearted

metaphors speak really to challenges
that people have and help them

communicate even to upper management
or the famous non-technical people,

who in many cases are more technical
than some of the developers, but

it makes it easy to communicate
the differences and the nuances.

And that's what I'm always aiming for.

Henry Suryawirawan: Right.

So I think it's always a fun
metaphor, coming from you, right?

Fruit salad versus fruit basket.

I hope people use this whenever they
explain about building platform.

Another thing, I think when we talk
about platform, right, there's so

many probably resources, posts, and
things like that related to developer

productivity, developer platform.

So in your point of view,
in your experience, what is

a good developer platform?

What kind of problems it should solve?

And what kind of strategy we should build
for developer platform in an organization?

Gregor Hohpe: So yeah, as I mentioned,
this is one of the popular use cases.

And one that I was personally involved in.

I think there's a couple of
different angles you can take.

And we first need to understand
that, this is actually out of Cloud

Strategy, and also from work at
GovTech, we called it the four leaf

clover of application oriented cloud.

So first, you need to understand,
what are all the things an

application needs in its ecosystem?

Because that's my candidates
for the platform, right?

And the answer is not
that difficult to get to.

The problem is people often latch
onto one thing and forget the other.

So, you need a CI/CD pipeline, you
need a build system because that's

how your software comes to life.

You need a runtime underneath.

You need monitoring and observability.

And you probably also need
some service integration for

things to talk to each other.

All those are good starting
points for platforms, right?

If I make it very easy, so basically, if
I have complete development environments

out of the box, like I don't need to
do anything and just say, what kind

of application do I want to build and
it builds that, now, that is useful.

Now, interestingly, that is so useful
that many base platforms do this now.

Like, I know our thing's best, but Code
Catalyst is basically doing exactly these

things as like a sort of template to give
you a full development environment, right?

But I think what really helps is to
have clarity on the different parts.

So, I think observability and monitoring
is often overlooked in these kind of

platforms and those are areas where having
some commonality is extremely helpful.

Because if something goes wrong, I don't
want to look like 12 different places

to find out what's actually happening.

So I would say, for teams to build
these internal developer platforms,

there are two parts of advice.

A, look at the whole picture.

Too many folks like, oh, platform
equals Kubernetes, right?

And they always talk about the runtime.

And that's nice, it's all great, but
you're forgetting all the other pieces.

Or people think only CI/CD
pipeline and forget the others.

So see the whole picture.

And second, think carefully about how
you're going to build this over time.

Are you going to make a sort
of minimal viable platform?

Another kind of buzzword, but are
you making something minimally viable

for all pieces and then you enhance?

Or you do you make a really,
really good CI/CD part, which is

like totally awesome, but you're
lacking all the other pieces, right?

And both have ups and downs, right?

Like, if you have four half finished
pieces, maybe it's very cohesive,

but it's maybe not that feature
rich versus the opposite, it's very

feature rich, but it's incomplete.

So there is no easy answer.

And the foreword of my book has a warning
label, like literally, like, it's sort

of like when you buy an appliance and
it says, you know, don't touch the wire.

So it has like a warning safety label.

And my safety label is the book
doesn't give you answers, right?

There's no easy answer.

One way or the other way is better.

The book is trying to help you
ask better questions and come

to better answers yourself.

And that's the same true here.

Both of those are viable routes.

And I want to help you be aware of
that decision and make that decision

consciously and give you some guidance.

But in the end, I cannot tell you
which one is better for your situation.

So, there isn't a magic score
chart or recipe for these developer

platform teams to be successful.

But it's more, it would sound a little
bit funny, but it's more around seeing

the whole picture, decision, discipline.

It sounds like very fluffy in a way.

But that is by far the hardest part
and by far the most important part.

Henry Suryawirawan: Right, apart
from developer platform, actually

some companies also think about
business capability platform, right?

Things like, for example, if you
want to reuse some parts of the

solution in the company, right?

They want to create a platform
so that other departments or

other teams can also reuse that.

Do you also have some advice for
people who are building this kind of a

business capability platform, so that
they avoid that kind of a loophole or

pitfall that people normally go into?

I

Gregor Hohpe: Yeah, and this is actually
one of the frameworks early in the book

for delineating in a more fine grained
way the different kinds of platforms.

It's like in-house people often have
technical platforms like the stuff we

just talked about, which is for running
applications and building applications.

And then they often have business
platforms and often they have

ecosystem-like platforms that
connect with other things.

So this is very real and it's useful.

Absolutely.

Again, you know, there are more failure
modes than one might think about.

And here's the catch that I see:
the business platforms, they're

stuck in the model of I can
anticipate what everybody needs.

And we said right in the beginning
that is dangerous and not

exactly what platforms are about.

The picture they tend to use, and
the Architect Elevator actually

already makes fun of that picture,
is the picture of a pyramid, right?

They say like, oh, I have all this
common business functionality like

accounting, HR systems, right?

Whatever I might need, that is for all my
lines of business and all my countries.

Then I have some other things that
might be country specific, and then I

have something like the little cherry
on the cake, maybe a few configuration

settings that just, you know, make
the specific market or product, right?

It's always that vision.

And on PowerPoint, that vision looks
amazingly good, because it's massive

amount of reuse and then each solution
just has to like put the little tiny token

on top and then everything is perfect.

In reality, this never works.

And it's not a platform.

It's again the antithesis of a platform.

Because the platform is not trying to
anticipate everything and it's trying to

enable people to build better solutions.

These business efforts,
they do the exact opposite.

They try to figure out what
could everybody possibly need.

I build this in and then people just
need to sort of fill in the little blank.

If they were right,
this wouldn't be so bad.

But in reality, it's impossible
to be right on all these things,

because needs are changing.

You just cannot possibly be so smart.

So my worry there, again, would be is
that the teams who now go on the platform

bandwagon are the same teams who did
that before, who built the pyramids.

And my joke is always, we stopped
building pyramids 4,000 years

ago for good reasons, right?

So, let's not do this again.

But it's the same story as
with the developer platforms.

If you have the same teams with the
same mindset, trying the new approach,

the odds that they fall back into
the old pattern is extremely high.

And that will void the whole platform
model and then things get worse.

Then management will see,
oh, this platform stuff

actually doesn't work, right?

We failed at it.

Oh, who told me all these
platform thingies, right?

And then they hire the consultants
for a lot of money to go fix it.

And the whole thing goes
into some sort of tailspin.

So yes, business platform is very
useful, but really you need to rethink

the way you go about making those.

Same as with the developer platforms.

Henry Suryawirawan: Right.

I think there are a lot of, lots
of learnings in this conversation

about platforms, right?

So I hope the listeners here, after you
heard about this from Gregor, right?

You rethink again, like, the
strategy for your platform.

Or if you are actually
building the platform, right?

Maybe you should label it something else.

So it's been a pleasure, Gregor.

Unfortunately due to time, we
need to wrap up pretty soon.

But I have the same question that I asked
you in the first episode, which is I call

the three technical leadership wisdom.

You can think of it just like
an advice that you want to

give to the listeners here.

It could be related to the
platform strategy or it could

be something else as well.

Gregor Hohpe: Hmm.

Yeah, and one would hope that
over the years I get wiser, so

there should be more wisdoms.

At the same time, I think
my own bar also goes up.

So let me see what is high on my
mind after working on this book.

I think one wisdom I've definitely
run into a lot is that bad

architects talk in extremes and
good architects talk in trade offs.

It's rarely ever the case that one thing
is the right solution for everything, and

especially not a technology architecture.

So my wisdom is don't get latched onto
everything must be event driven or

loosely coupled to a Kubernetes or this
cloud vendor or that cloud vendor, right?

That is rarely the right answer.

The other wisdom that I might
give is that organizations tend

to reward specialists, right?

Like, if you're really good at
something, it's very easy to put you in

a certain box and you will do very well.

I have friends who do database tuning
and they charge crazy amounts of money,

because they are really good at this.

Somebody's database doesn't work, the
customers are not happy, they go in

for like a day and charge some crazy
amount of money, but the customer is

happy because now everything is working.

So it's very tempting to go this route.

But what I find is that the kind
of solutions that we build also

consider being a dot connector, right?

We just talked earlier about, oh, building
this platform is highly technical,

it's cloud stuff, it's queues and time
to live and distribute the system,

but it's also domain driven design.

Very much so.

So my second advice would be look
over the horizon and see whether you

can piece different things together.

Because I think, in today's world,
that might be as important as

being a specialist in some area.

And my last advice that I often
give is, thinking is the highest

ROI activity you can possibly do.

I see too many people who say,
oh, we need to make a decision.

Oh, let's ask the expert.

Let's get an answer.

Let's move forward.

And when you say, oh, let's think
about this, like we did earlier.

Like oh, the queue versus SQS
versus the ledger database, right?

Like we're sort of musing and reflecting,
and it's a little bit abstract.

It's too easy for people to put that away
as like, oh, no, we're not in school here.

We don't need to philosophize,
we need to go make a decision.

And I think that's shortsighted.

So my third advice would
be take time to think.

Play around a little bit with metaphors
and words and different things, because

that time is extremely well spent and
will pay off many, many times over.

Henry Suryawirawan: Wow, really beautiful!

I think these are all different
from the first episodes you gave.

So I think that's really,
really cool advice.

So Gregor, for people who love to
read the book, is there a place

where they can find it online?

How they can reach out to
you and things like that?

Gregor Hohpe: Yeah.

So I'm fairly active on social media.

So LinkedIn is always good.

And sort of my home base
for all these things.

As I've mentioned at the very
beginning, all these books are

essentially applications of
the Architect Elevator concept.

So architectelevator.com is still the
best starting point for all the different

books and my blog and everything else.

So I'm always happy for
folks to start from there.

Henry Surya: Thank you again for
your time for this second episode.

So I look forward for more
strategy books from you.

And thanks again for explaining
about platform today.

Gregor Hohpe: Yeah, I'll do my best.

I'll look ahead for the next
episode when the next book is done.

Always a pleasure.

Henry Suryawirawan: Thank you
for listening to this episode and

for staying right until the end.

If you highly enjoyed it, I would
appreciate if you share it with

your friends and colleagues who
you think would also benefit

from listening to this episode.

And if you're new to the podcast,
make sure to subscribe and leave me

your valuable review and feedback.

It helps me a lot in order
to grow this podcast better.

You can also find the full show notes
of this conversation on the episode

page at techleadjournal.dev website,
including the full transcript, interesting

quotes, and links to the resources
mentioned from the conversation.

And lastly, make sure to subscribe
to the show's mailing lists

on techleadjournal.dev to get
notified for any future episodes.

Stay tuned for the next
Tech Lead Journal episode.

And until then, goodbye.


