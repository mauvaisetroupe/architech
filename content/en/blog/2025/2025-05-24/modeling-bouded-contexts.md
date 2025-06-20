---
title: "Modelling Bounded Context"
tags: [DDD, EventStorming]
date: 2025-05-24
categories: [English]
draft: true
---


## Introduction

This blog post is a sumary of a youtube video [[Hands-on] Exploring Techniques For Modelling Bounded Context Collaboration](https://www.youtube.com/watch?v=oj4zGj6sPDc), with the intervention of Nick Tune

![alt text](/blog/2025/2025-05-24/image-19.png)

### Bounded context and microservices

This 1–2 hour session covers modeling bounded contexts as part of strategic design.

Bounded contexts define system boundaries and are often aligned with microservices. The relationship between the two is widely debated, including in a recent post by Alberto Brandolini.

### Integration of subsystems - Designing a loosely coupled architecture

Subsystem integration is often overlooked in design. Loosely coupled architectures support autonomy and safe changes, but require thoughtful communication, not just clear boundaries.

Commands, queries, and events shape interactions and affect coupling. Design choices—like orchestration vs. choreography—are key.

We’ll explore message flow modeling to visualize these interactions and discuss emerging best practices like event storming.

### global and local complexity

As noted by Vladik Kononov, distinguishing between local and global complexity helps clarify system design discussions.

Local complexity refers to the internal simplicity of a component (e.g. a 100-line microservice). Global complexity arises from the interactions between many such components—introducing challenges like network boundaries, versioning, and backward compatibility.

While small services may be simple individually, their communication adds global complexity. Message flow modeling focuses on managing this, emphasizing interaction design over internal structure.

## Modeling tools

### BPMN

BPMN is useful for visualizing workflows, but its value depends on how it's applied. One approach embeds all logic within BPMN, aiming to replace developers. A better alternative keeps logic in microservices, using BPMN to map workflows and calling it as needed.

As BPMN and message bus systems converge, it raises important questions about their roles in orchestration and integration

![BPMN collaboration](/blog/2025/2025-05-24/image-6.png)

Tools like BPMN evolve, and staying open to their growth is important. While it may not meet all current needs, ongoing community innovation—especially for remote collaboration—could enhance its value. In time, BPMN might even rival techniques like event storming in certain contexts.

### event storming

Event Storming is a flexible, collaborative tool with low entry barriers, great for building a shared system understanding. However, it needs a skilled facilitator to stay focused. It's most effective when a clear user journey exists; domains without linear narratives—like adaptive cruise control—can be harder to model.

![event storming](/blog/2025/2025-05-24/image.png)

The use of "query" in the diagram, colored like a read model, introduces ambiguity. Event Storming's flexibility with labels and colors (e.g., orange for events, green for read models) can guide understanding but may cause confusion, especially for newcomers due to variations in naming (e.g., "context," "external system").

### UML

UML, especially sequence diagrams, offers precise system interaction modeling, reducing misinterpretation. While less flexible than Event Storming, it provides clarity in event flow and system interactions, avoiding ambiguity about parallel or sequential events.

![uml sequence diagram](/blog/2025/2025-05-24/image-1.png)


### Domain Message Flow Modelling

Introduced by Nick Tune in 2020, Domain Message Flow Modeling visually represents the flow of commands, events, and queries within a bounded context. While boundaries define systems, clear message interactions are key to designing loosely coupled architectures.

Domain Message Flow Diagrams show how messages move between actors, bounded contexts, and external systems, with two modeling styles: simple and advanced.


#### Domain Message Flow Modelling - Simple version

![Domain message flow modelling (simple)](/blog/2025/2025-05-24/image-3.png)

The simple version treats all messages equally, without distinguishing between commands, events, or queries. It’s useful for teaching or early-stage modeling, focusing on directional message flow rather than message types.

#### Domain Message Flow Modelling - Advanced version

![Domain message flow modelling (advanced)](/blog/2025/2025-05-24/image-4.png)



The advanced version uses distinct notations and color coding for each message type, helping experienced practitioners recognize patterns and avoid anti-patterns. Events are decoupled from commands to highlight their broadcast nature.

As users gain expertise, the model evolves, balancing clarity and expressiveness based on the scenario and audience.

### Event modeling

![Event Modelling](/blog/2025/2025-05-24/image-7.png)

Event modeling visualizes message flows (commands, queries, events) with a focus on UX over UI, adding detail to event storming for implementation. 

It can be complex at first but becomes easier with experience. Unlike event storming, which is highly collaborative, event modeling is more structured and less adaptable, especially for parallel processes. It drives development by focusing on data transfer and message structure and often leads to event sourcing and CQRS. 

Event modeling strikes a balance between the flexibility of event storming and the structure of UML.

### Service Blueprints

Bridging Service Design and Domain-Driven Design.

![Service Blueprint](/blog/2025/2025-05-24/image-8.png)

The concept of a service blueprint is explored in contrast to bounded contexts. Service blueprints provide a high-level view of end-to-end services, focusing on user experience and solving broader problems. In comparison, bounded contexts are more technical, focusing on implementation details. For example, an online shopping service’s blueprint spans multiple bounded contexts, each representing different actions.

While service blueprints align with strategic, enterprise-level perspectives, they can still be drilled down to detailed levels. A future meetup could explore the connection between domain-driven design and service design, using service blueprints to bridge the two, similar to Susan Kaiser’s talk at DDD Europe that linked Wardley mapping to bounded contexts and service design.

### Canvas

![Bounded context canvas](/blog/2025/2025-05-24/image-5.png)

In big-picture discovery, the outcome is often unclear, but when modeling bounded contexts, the results are more defined and achievable.

A workshop could focus on creating a bounded context canvas, aiming to identify all commands, queries, and events related to a specific context, both incoming and outgoing. If multiple contexts are involved, the scope could expand to include canvases for each.

To design the workshop, start with what’s needed for the goal. For example, if an event storming session has already identified context boundaries, use that as the starting point. Define the necessary notation (e.g., bounded context, commands, queries, events), then focus on use cases like accepting payments or creating new credit cards. The goal is to map the flow of messages at a high level of abstraction.


## Feedbacks and questions

### Structure vs Chaos

Message flow diagrams require manual layout of contexts and messages, offering flexibility but adding complexity compared to the automated structure of UML sequence diagrams. This freeform approach highlights architectural patterns, such as coupling, that rigid diagrams may obscure. While more challenging initially, message flow modeling reveals deeper system behaviors over time.

A key heuristic is to maintain openness and avoid premature structure, as unstructured approaches can uncover insights hidden by more rigid methods. For example, recognizing excessive commands or queries may reveal architectural anti-patterns, such as tight coupling or a query-driven architecture, typical of distributed monoliths, where failures in one service can collapse the entire system.



### Balancing Structure and Complexity

Structuring a diagram can highlight system issues, but not all complexity is meaningful. Over-structuring may introduce accidental complexity without adding insight.

The choice between structured and freeform modeling depends on session goals—flexibility aids discovery, while structure provides clarity, though it may obscure design flaws.


### External System vs Bounded Context

In Domain-Driven Design (DDD), a bounded context defines a conceptual boundary around a model and shared language, while a system includes bounded contexts and external elements that support a domain. A website, for example, can have multiple bounded contexts (e.g., user authentication, shopping cart, product catalog) within the same system.

Simply put, a system is anything that’s not a bounded context. A website, often not considered a bounded context, serves as a user-facing front-end, exposing the domain but not handling complex business logic, which is managed in back-end services or microservices.


### Simplicity vs Precision: Balancing Notation

The discussion shifts to the trade-off between simplicity and precision in modeling. Adding more notation increases complexity but can provide greater clarity and precision, while overly simplifying a model may introduce ambiguity. The key is to use notation as needed, starting simple and expanding to add necessary detail, ensuring the model effectively conveys the design intent.

### Flexibility, Structure, and Purpose of Notation
Three key principles emerge from the discussion:
1.  Simplicity vs Precision: Balancing simplicity with enough detail for precision.
2. Structure vs Flexibility: Deciding between structured approaches (like UML) and flexible models (like message flow diagrams), where flexibility adapts to problems but may complicate communication.
3. Design Tool vs Documentation Tool: For design, flexibility is vital to accommodate evolving ideas; for documentation, structure and consistency are prioritized for clarity.

In summary, model design should balance flexibility and clarity, adapting to the problem while maintaining consistency for communication.

### Adjusting the Level of Detail

In some cases, more detail is needed, especially when uncertain whether to model an action as an event or command. Exploring the internal workings of the bounded context, such as considering a process manager, can help clarify decisions.

The level of detail and notation evolves during the workshop. Initially, a defined set of notations is used with little flexibility, but as participants gain experience, the approach becomes more adaptive. The appropriate level of detail and notation will emerge dynamically as the workshop progresses.

### Creativity and Adaptation at Advanced Levels

The most exciting part comes when participants reach the advanced level, where the tools become flexible, allowing for creativity. Instead of strictly following predefined methods, the goal is to adapt the tools to the context's specific needs, making the process both challenging and rewarding.

### Story Mapping Technique: Problem vs. Solution Space

User story mapping organizes tasks around user journeys, focusing on the problem space, but lacks the broader context to explore solutions. Event storming captures both problem and solution spaces by modeling events and interactions, offering a more complete view of user and business processes.

In short:
- Story mapping is task-focused and problem-oriented;
- Event storming is event-driven and solution-inclusive.

---


## Event Storming Workshop: Adaptive Cruise Control

In this workshop, we explored a practical example using **event storming** to model the behavior of an *Adaptive Cruise Control (ACC)* system in vehicles. Here's a cleaned-up walkthrough of the early stages of our session.
### Scenario description

#### Introduction and Roles

**Facilitator:** “Kenny, you mentioned a domain earlier — would you like to act as the domain expert?”
**Kenny (Domain Expert):** “Sure! This is actually one of my favorite features in cars — Adaptive Cruise Control.”
**Facilitator:** “Great, I’ll be the facilitator for the first five minutes, and then we can switch roles.”


#### Understanding the Domain

We began by defining the core system we’re modeling: **Adaptive Cruise Control (ACC)** for cars.

**Kenny explained:**

> “While we have self-driving systems in Teslas today, I’ve been using an ACC-enabled car for the past three years. The core function of ACC is to maintain a set speed, like traditional cruise control, but with an added feature: it detects the car in front and automatically adjusts speed to maintain a safe distance.”

#### Deciding the Scope

We discussed how deep we wanted to go in modeling.

**Facilitator:** “Are we modeling a simple transaction or a full user journey?”

**Kenny:** “There are multiple user actions and system behaviors, so it’s more of a journey. I’ll describe it, and we can break it into specific functions.”

---

### Mapping the User Journey

We started visualizing the journey using sticky notes, beginning with a clear scenario.

#### Scenario: Setting Cruise Control

**Facilitator:** “What’s the scenario we’re modeling?”

**Kenny:** “Let’s start with *setting the cruise control*. Though I don’t love the term ‘setting’ — we might find a better word later.”

We identified our user as:

* **A non-commercial, commuting driver**
* **Driving a mid- to low-range electric vehicle (not a Tesla)**


#### Step-by-Step: The Happy Path

1. **Driver sets the cruise control speed.**
2. **If there are no cars nearby**, the system adjusts the car’s speed to match the set cruise speed.

> 🟡 *Placeholder added for the scenario where cars are around — to be explored later.*

![modelling workshop1](/blog/2025/2025-05-24/image-9.png)


#### Possible Events After Setting Cruise Control

From this point, one of four things can happen:

1. **Driver brakes** – this automatically disables cruise control.
2. **Driver manually cancels cruise control.**
3. **Emergency braking is triggered** – cruise control ends.
4. **A slower car is detected ahead** – ACC adjusts speed accordingly.

> 💡 A YouTube viewer suggested "cancel" as a better verb than "end" for manually disabling cruise control.

We briefly discussed that the phrase *“slower cars detected nearby”* may best describe the situation, since ACC primarily responds to vehicles directly in front of the user.

![modeling workshop2](/blog/2025/2025-05-24/image-10.png)

#### What’s Next?

At this point in the workshop, we recognized the increasing complexity of possible events and transitions. While we had more scenarios to explore, we chose to keep the focus on this happy path and its immediate variations — at least for the initial modeling.


---

### Shifting from Problem Space to Solution Space

At this stage of the workshop, we decided to move from exploring the **problem space** to shaping the **solution space**.

**Facilitator:**

> “Let’s move to the solution space now. We can always return to the problem space if needed.”

While the problem space around Adaptive Cruise Control wasn't overly complex, we began considering how to visually model the system.

#### Choosing the Right Modeling Approach

We discussed different diagram types for modeling the flow of messages and interactions.

**Facilitator:**

> “I’m leaning toward creating a **message flow diagram** here. It feels like a simple enough domain that this should capture the key interactions.”

**Participant:**

> “Yeah, either that or maybe a UML diagram.”

But we gravitated toward a domain-driven alternative:

> “I’d go for this one — it’s inspired by **Domain Storytelling**, which I find a bit like UML diagrams, but more flexible and grounded in the domain language.”

This approach gave us a more **narrative-driven and visual** way to illustrate interactions while staying true to the business perspective.

#### Why This Model Works Here

We agreed that a domain-inspired message flow was more useful than the traditional left-to-right event storming layout — at least for this particular case.

> “Event storming is very linear. You go from left to right through events, and when a lot starts happening in one part of the flow, it can get overwhelming. A domain message flow feels clearer for this situation.”


#### A Heuristic for Choosing Diagrams

The team applied a useful rule of thumb to guide their choice:

> “If there’s not much *back-and-forth conversation* or complexity in the interactions, a simple flow diagram should do. But if this model turns out to be too simplistic, that’ll be our signal to return to the problem space.”


Thanks! Here's the next polished section for your blog post, continuing the flow and incorporating your request for clarity and structure.

---

### Modeling Repeated Events: When to Duplicate

As the modeling continued, a great question came up about **repeating events** and whether it's acceptable — or even advisable — to **duplicate events** across different parts of the flow.

**Participant:**

> One thing I want to ask: can I duplicate events here? For example, *‘slower car detected nearby’* might later result in *ending cruise control* — or some other action — but would repeating the same event add unnecessary complexity?”


#### Use the Heuristic: Duplicate and Qualify

The facilitator introduced a simple and effective rule of thumb:

> “Whenever you see the same event happening in different contexts or points in the flow, **always qualify it.**”

That means it’s okay to duplicate an event — as long as you add context to make its meaning clearer in each case.

**Examples:**

* `Cruise control ended due to slower car detected`
* `Cruise control ended due to journey completion`

> “We might even find better names for these events. For example, when cruise control is turned off due to a slower car ahead, maybe it's not just *‘ended’*, it could be something like *‘collision prevented’* or *‘adaptive override triggered’*.”


#### Why Qualification Matters

By qualifying repeated events, we avoid ambiguity and improve the **domain clarity** of our model. Instead of seeing several generic "Cruise control ended" events, each one carries **specific meaning and intent**, helping both technical and business stakeholders understand the system behavior.

> “I would always duplicate, qualify, and then try to improve the naming. That way, each event tells a more complete story.”

---

### Modeling Commands and Boundaries

#### Exploring Alternative Event Storming Types

A question came up about trying different event storming types:

> “Can we use other types of event storming here — like **Design-Level** or **Value-Level Event Storming** — instead of switching to a different technique for modeling commands, aggregates, and projections?”

The group decided to proceed with **Design-Level Event Storming** for the next few minutes.

> “Let’s do five more minutes on this technique, finish up this model, and then compare by trying a short session using event storming again.”

---

### Capturing the Command Flow

#### Identifying the Interface: Steering Wheel Controls

The system interface for setting cruise control is physical:

* **Steering wheel buttons** act as the main input mechanism.
* Some newer cars may feature **voice control**, though this was speculative in the discussion.

> “It’s like using a controller — similar to a PlayStation or Nintendo Switch controller — where you press ‘on’, ‘off’, or adjust settings.”

#### How Speed Is Set

Speed is initially based on the car’s **current speed** when the user activates cruise control:

* The driver can adjust it afterward.
* In future models, drivers might use voice commands like:

  * “Set to 100 kilometers per hour.”
  * “Drive as fast as possible.”

![modelling workshop3](/blog/2025/2025-05-24/image-11.png)

### Establishing the First Bounded Context

#### Interface vs. Business Logic

The physical interface (buttons or voice) is not where business rules live. It merely **passes user input**.

The next component is a **control unit or processing system** that interprets the command.

#### Naming the Bounded Context

The team agreed to label this first bounded context:

* **Cruise Control Service**
  This is where actual domain logic begins — handling requests and translating them into system actions.

![modellling workshop - flows](/blog/2025/2025-05-24/image-12.png)

### Cruise Control Domain: Exploring Solution Boundaries

#### Cruise Control Service Naming

The current name **Cruise Control Service** was acknowledged as generic:

> “It probably is doing too many things. But let's go with it for now — this technique will help us uncover that.”

---

### UI and Business Logic Separation

* **Steering Wheel / Voice UI**:
  Acts purely as a forwarder of commands. No business logic.
* **Cruise Control Service**:
  Handles user commands like “Set Cruise Speed” and applies domain rules.
* **Engine Service**:
  Receives low-level commands like `Adjust Speed`, and does **not** know about cruise control at all.

---

### Control Flow Breakdown

#### Cruise Control Interaction

* **User Command**:
  Activates cruise control via physical interface.
* **Cruise Control Service**:
  Converts this into a command like `Adjust Speed` with a target speed.
* **Engine Service**:
  Executes the command without knowing it came from cruise control.

#### Open Question: Engine Command Semantics

* Should the `Engine Service` receive **absolute target speed**?
* Or should it handle **incremental commands** like `Accelerate`, `Decelerate`, with rate/intensity?

The discussion raised concern over:

* **Race Conditions**:
  E.g., if cruise control says “increase speed to 70” but the user simultaneously presses the gas pedal to reach 70.
* **User Overrides**:

  * **Gas pedal** can override cruise control temporarily.
  * **Brake pedal** typically **cancels** cruise control.


  ![workshop](/blog/2025/2025-05-24/image-13.png)

---

### Feedback Loops and Real-Time Adjustment

* The `Cruise Control Service` may need to continuously:

  * Receive actual speed feedback.
  * Re-issue adjustments based on drift from the target speed.
* This creates a feedback loop between:

  * **Cruise Control Service**
  * **Engine Service**
  * **Speed Sensor/Telemetry**

---

### Diverging Control Paths

1. **Cruise Control Path**
   → Steering Wheel Input → Cruise Control Service → Engine Service

2. **Manual Acceleration Path**
   → Gas Pedal Input → Engine Service (direct)

These two **concurrently** affect the engine, requiring arbitration logic (possibly by the engine service or some orchestration layer).

---

### Modeling Implication: Need to Return to Problem Space

> “What I’m seeing is that we modeled out the problem space and it looked simple.
> We jumped into the solution space, and now we’re uncovering all these edge cases.”

It’s now clear that we should:

* Drift back into **problem space modeling**.
* Explore **scenarios** such as:

  * User activates cruise control, then uses the pedal.
  * User overrides cruise control temporarily.
  * User applies brake, cancelling cruise control.

Once that’s mapped clearly, return to refining the **solution model**.



---

### Modeling Whirlpool (Eric Evans)

* **Concept**: The *Modeling Whirlpool* explains the natural flow of domain modeling — oscillating between the **problem space** and the **solution space**.

#### Whirlpool Stages We Followed:

1. **Tell a Story**

   * Walk through concrete user scenarios (e.g. activating cruise control).
2. **Propose a Model**

   * Built an initial model (e.g. Cruise Control Service, Engine Service).
3. **Gain New Insight**

   * Edge cases and technical details emerged (e.g. user pedal override, race conditions).
4. **Return to Story**

   * Decided to revisit scenarios to refine understanding.

> “This back-and-forth is the modeling whirlpool in action.”

---

### Notes on Miro as a Tool

* **Infinite Canvas** enables:

  * Rapid exploration of alternative scenarios.
  * Layering multiple models without pressure to delete.
* **Flexibility Over Physical Boards**:

  * No sunk cost in moving, duplicating, or discarding models.
  * Encourages iteration and rethinking without friction.


### Final Thoughts on Modeling Practice

* What you're doing is **core to DDD**:

  * Telling stories.
  * Modeling based on those stories.
  * Refining the model when complexity surfaces.
* The key is **not to seek perfection upfront**, but to **embrace iteration**.
* As complexity emerges, **go back, refine, and model again** — that’s where deeper understanding comes from.

------------------------------

### Can Big Picture Event Storming Help Identify Bounded Contexts?



Thanks for sharing that! I've rewritten your transcription to be more readable and structured as a blog post, while maintaining the core ideas and conversational tone. Here's a cleaned-up version you can use or further refine for your blog:

---

## How Event Storming Helps Identify Bounded Contexts

During a recent workshop, Nikki asked a great question:

> “When we run a Big Picture Event Storming session, can we use that to identify bounded contexts? If so, how do we go about it—by grouping events or in some other way? Or should bounded contexts be identified independently of the event storming?”

The short answer is: **yes, Big Picture Event Storming can help**, but it's not always straightforward.

### Bounded Contexts Aren’t Always Obvious

In theory, you might look at an event storming board and think you can neatly divide the events into sections, each corresponding to a bounded context. But in reality, it's rarely that clean.

Often, events tied to a single bounded context appear in multiple places on the board. A single bounded context might show up at the start of a process and then again at the end. That’s why Alberto Brandolini, the creator of Event Storming, refers to them as **emergent bounded contexts**. They emerge from the process—they aren’t predefined.

As Nick put it:

> “You might see the same bounded context repeated multiple times. That’s a smell to me—it suggests there’s something worth investigating further.”

### Look for Purpose, Not Just Structure

Just because a bounded context appears in different phases of the flow doesn't automatically mean something is wrong. But it does raise questions. Are those events really part of the same business purpose? Or is the process entering a different phase with a different goal?

Consider the lifecycle of a bank account:

* A user creates an account
* Deposits money
* Withdraws money
* Closes the account

These activities don’t always happen in a tidy sequence, and they're often interspersed with other processes—like applying for a mortgage or opening a savings account. Trying to map these to a single bounded context can get messy.

| Phase              | Potential Contexts    | Shared Data           |
| ------------------ | --------------------- | --------------------- |
| Create Account     | Account Setup Context | Account ID, User Info |
| Deposit / Withdraw | Transactions Context  | Account Balance       |
| Close Account      | Closure Context       | Account Status        |

> Even though these are separate phases, they **all rely on the same domain object** — the *account*. This leads to modeling challenges and tradeoffs (cohesion vs. duplication).

### Capabilities vs. Business Phases

It’s also important to distinguish between **business phases** and **capabilities**. A single capability—like handling account balances—might span multiple business phases. You can't always assign it neatly to just one part of the process.

This ties into insights from a well-known paper by David Parnas, which argues that good software design often involves identifying and managing elements that are shared across multiple phases. That’s a more modular approach, which aligns well with the idea of reusable capabilities in DDD.

### Modeling is Iterative

Ultimately, bounded contexts are part of **tactical design**—they're implementation details. Big Picture Event Storming, on the other hand, is a **problem-space** exploration tool. It helps you see potential contexts, but doesn't define them for you.

This is why it's useful to try multiple modeling approaches. As Eric Evans says:

> “A model is not a model unless you’ve tried at least three different ones.”

So experiment. Try grouping events in different ways. Use different tools. Test your assumptions. Over time, the right contexts will start to emerge.


Big Picture Event Storming doesn’t define bounded contexts directly — **it reveals them**. You discover them through patterns, language, and domain insights, then validate and refine them using additional modeling tools.


Domain Message Flow Modelling : https://github.com/ddd-crew/domain-message-flow-modelling

EventStorming examples : https://draft.io/example/eventstorming

EventStorming Glossary & Cheat sheet: https://github.com/ddd-crew/eventstorming-glossary-cheat-sheet?tab=readme-ov-file


https://medium.com/nick-tune-tech-strategy-blog/modelling-bounded-contexts-with-the-bounded-context-design-canvas-a-workshop-recipe-1f123e592ab


---------------

https://www.avanscoperta.it/en/eventstorming/


![process modelling](/blog/2025/2025-05-24/image-17.png)
![psoftware design](/blog/2025/2025-05-24/image-18.png)

Software Design EventStorming
The Software Design EventStorming aims to design software models to support complex business processes. The Event-driven nature of the exploration makes it a perfect modelling tool for Domain-Driven Design, keeping the discussion in the liminal space between business and technology but supporting more software-oriented activities like determining boundaries between cooperating models (see also Context Mapping) and enforcing consistency on the Aggregates lifecycle.

Software Design EventStorming is still based on the idea of collaborative games but expands the grammar with extra building blocks and extends the Process Modelling ruleset with two extra rules.

Boundaries should be visualised.
Software components should have consistent behaviour.
The expanded grammar allows boundaries to be visualised—and moved, in the case of discussions—bringing coherence to the picture.


A Software Design EventStorming usually results in a left-to-right flow where boundaries and key building blocks start to emerge. Aggregates are shaped by their behaviour and role in the end-to-end interaction, looking more like state machines than data containers.

Green Read Models instead capture the data needed to make key decisions. The discussion also raises many issues we can capture with magenta Hot Spots.

----------



---------

## Resources

https://youtu.be/QwOrbYTaDOY?si=6-tC-kxVU1m99l-h&t=2119
Title: EventStorming: From big picture to software design
Speaker: Cédric Pontet (Agile Partner)
Voxxed Days Luxembourg 2019

![Softwarw design and event storming](/blog/2025/2025-05-24/image-15.png)
After big picture and process modelling, things are now clear enough to represents thins as software artefacts
![software design post-its colors](/blog/2025/2025-05-24/image-16.png)
Aggregate is something that will be transformed into code, classes or functions. It's basically a state machine, something with a lifecycle, focus on behavior, not on data (idea of object-oriented programming). All business rules should be enforced by that aggregate

----------------------
Big Picture Event Storming - cnocrete example https://medium.com/@chatuev/big-picture-event-storming-7a1fe18ffabb
Systems
The last valuable subject we are going to discover in the big picture event storming is Systems.
A System could be anything that provides solutions in your business domain, e.g. a deployable service developed inside your company or external third-party providers that your company is integrated with. An example of an external system could be an email-service or push-notifications service which sends notifications to Passengers, checkout service, Excel sheet, Google file hosting, Facebook business page, or a smartphone which Passenger and Driver may use to call each other.
Systems are documented with a big pink post-it.

Dommage manque l'article suivant
"The next step to design microservices using DDD is to run Software Design Event Storming and shape future microservices using Bounded Contexts and DDD tactical patterns."

---------------
https://www.amdocs.com/insights/blog/event-storming
The systems and third-party services within the process that interact with your application. These systems can give a command or be notified by a process, for example:
An external payment gateway
An SMS notification service
A reseller’s external AP
Systems are other entities such as other components in the monolith or third-party applications that interface with your application. Systems create Commands based on pre-defined scripts such as a scheduled job or when certain conditions are met in resource or log monitoring. 

Step 7: Aggregate the Domain Events
Aggregates are typically represented as nouns, and they are your business entities, typically stored in a database. To put it simply, they are the things that your Commands are acting on and what your Domain Events are creating, reading, writing, and deleting. Some examples of Aggregates using our example below are order, payment, product.

Step 8: Create the Boundaries
Our final Event Storming step is to create our Boundaries, also known as the Bounded Context. These Boundaries help to separate a business process into smaller sub-domains. Later, in the architecture, each Boundary will often be represented by one or more microservices. A Bounded Context may consist of more than one Aggregate, which could span across multiple Boundaries. To avoid microservices becoming too large, keep the number of events within a single Boundary to a minimum. A good reference would be to aim for being able to describe a single Boundary with just one to five Agile user stories.

---------------------

https://www.domainlanguage.com/ddd/whirlpool/

The document you find here is Eric Evans’ attempt to capture in writing a process we have used with clients in various forms and settings for the several years. This is not a development process. It should fit within most processes that iterate on the design.

-------------------

https://mendelbak.medium.com/understanding-david-parnas-information-hiding-and-system-modularization-f491420d2d87
An interpretation of David L Parnas’ “On the Criteria To Be Used in Decomposing Systems into Modules”


-----------------------


https://speakerdeck.com/ziobrando/extreme-ddd-modelling-patterns


------------


https://draft.io/example/eventstorming