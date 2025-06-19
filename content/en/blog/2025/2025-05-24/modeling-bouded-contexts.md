---
title: "Modelling Bounded Context"
tags: [DDD, EventStorming]
date: 2025-05-24
categories: [English]
draft: false
---


## Introduction

This blog post is a sumary of a youtube video [[Hands-on] Exploring Techniques For Modelling Bounded Context Collaboration](https://www.youtube.com/watch?v=oj4zGj6sPDc), with the intervention of Nick Tune

![alt text](/blog/2025/2025-05-24/image-19.png)

### Bounded context and microservices

In this session, we’ll be exploring techniques for modeling bounded contexts.
The goal of this meetup, which will last around one to two hours, is to focus on strategic design.

When we think about architecture and strategic design, bounded contexts often come to mind. It’s about identifying and defining clear boundaries within a system.
Architecting a system typically involves breaking down a large, complex structure into smaller subsystems.
Some people refer to these as microservices, others call them bounded contexts, and some consider a microservice to be a bounded context in itself.

There are certainly strong opinions on this topic, and quite a few blog posts have been written about it — including a recent one by Alberto Brandolini that touches on this very subject.

### Integration of subsystems - Designing a loosely coupled architecture

A topic that receives less attention is the integration of subsystems — whether they are microservices or bounded contexts — particularly during the design phase.
While event-driven architecture is frequently discussed from a technical standpoint, it is less commonly approached as a design activity.

Designing a loosely coupled architecture remains a widely accepted goal across the software industry. A loosely coupled system allows for isolated changes within one part of the system without impacting others, thereby supporting team autonomy.

Achieving such decoupling requires more than identifying appropriate boundaries; it also involves determining how the various subsystems interact and making deliberate design choices regarding their communication.

Broadly speaking, there are three types of messages: commands, queries, and events. The term "message" is used here in a generic sense, not referring to a message bus.

For each message type, decisions need to be made regarding its payload. Numerous factors influence these decisions, such as the type of message, its content, its naming, and its size. Each of these factors can significantly impact the level of coupling between subsystems.

For example, a command involves one context instructing another to perform an action, leaving the responsibility for subsequent actions with the sender. In contrast, an event indicates that something has occurred, and it is then up to another context to listen to this event and determine the appropriate response.

This distinction touches on the concept of orchestration (centralized coordination) versus choreography, where the integration design plays a critical role in the overall coupling.

Although much attention is given to defining boundaries, integration design, particularly in terms of how subsystems communicate, is often overlooked.

There are many tools available, but none have yet become standardized. While there has been much discussion on this topic, particularly in a GitHub issue thread, there is still no clear consensus.

A simple technique called message flow modeling will be introduced later. On the GitHub project for this technique, a lengthy discussion took place regarding how to display the flow of commands and events across different contexts. Many opinions were shared, and this conversation ultimately led to the organization of this meetup to review various techniques and evaluate their trade-offs.

The goal is to begin shaping best practices for system design. For instance, when faced with a specific situation, event storming might be the most appropriate technique for defining boundaries and illustrating communication between bounded contexts.

### global and local complexity

Another concept worth mentioning, as noted in the meetup description, is the distinction between global and local complexity, introduced by Vladik Kononov.

While the terms may be familiar, their specific naming can help clarify these concepts and facilitate their discussion.

Local complexity refers to situations where something is inherently simple. For instance, a microservice with 100 lines of code is considered simple due to the limited amount of code. Although it's possible to introduce significant issues within such a small codebase, a smaller microservice (100 lines) is likely to have less local complexity compared to a much larger one (10,000 lines).

However, the challenge arises when there are multiple small microservices. While each individual service may be simple, the overall system becomes more complex in terms of how these services interact with each other. The flow of messages between microservices introduces new complexities, particularly around network boundaries and public contracts. In a monolithic codebase, changes can be made atomically, but with separate codebases that are deployed independently, modifying the interface of one service can break the other, introducing concerns about backward compatibility and versioning.

Thus, the key distinction is between local and global complexity. In the context of message flow modeling or bounded context integration, the focus is on managing global complexity — the complexity that arises between bounded contexts, particularly in terms of communication patterns, rather than the infrastructure itself.

## Contexte Mapping (question in chat)

Context mapping is a useful technique for addressing global complexity and defining communication patterns between bounded contexts. However, its effectiveness depends on how well it is applied — and in many cases, it is not used properly. One lesser-known but effective way to learn it is through Eric Evans’ workshop, where context mapping is practiced using role-playing within a fictional organization, helping participants internalize the patterns through experiential learning.

Among the patterns in context mapping, the conformist pattern is particularly relevant to global complexity. This pattern involves one context reusing the domain model of another, often due to the high cost of translating between models. For example, a system might directly reuse an external API model, such as Facebook’s marketing API. While initially convenient, this approach can result in strong coupling: when the external model changes, all dependent contexts may be forced to adapt. Over time, this can lead to a chain of conformists, where multiple contexts depend on each other’s models, creating a fragile system of dependencies.

This phenomenon — sometimes referred to as the deadlock conformist pattern — is common in large enterprises. Identifying and visualizing such chains through context mapping can help anticipate risks and reduce unintended coupling.

## Modeling tools

### BPMN

BPMN is a tool for visualizing workflows, though its effectiveness can vary depending on how it is used. There are two common approaches to BPMN: one where the tool attempts to replace developers by embedding all logic within the BPMN system, and another where BPMN is used to define workflows while keeping the logic within separate microservices. The latter approach allows microservices to call the BPMN system at appropriate stages, helping visualize the process without disrupting the code base. However, the boundaries between BPMN and message bus systems are beginning to blur, which raises questions about the best way to integrate them for system orchestration.

![bpmn collaboration](/blog/2025/2025-05-24/image-2.png)

![BPMN collaboration](/blog/2025/2025-05-24/image-6.png)

Tools, like BPMN, evolve over time, and staying open-minded to this evolution is crucial. Even if a tool doesn’t meet current needs, future updates may address limitations. The widespread use of BPMN suggests its value, with potential innovations emerging from the community. Additionally, as remote work increases, BPMN tools might be adapting to become more suitable for distributed teams. Who knows—one day, the BPMN community might develop a tool or approach that even surpasses event storming in some contexts.

### event storming

Event Storming is valued for its flexibility, explicitness, and collaborative nature, with a low barrier to entry. It allows teams to work together on a holistic view of the system. However, it requires a skilled facilitator to manage potential chaos, as sessions can sometimes veer off track. Additionally, while Event Storming is highly effective for certain domains, it requires a user journey or story to be viable. For instance, modeling a system like adaptive cruise control, which reacts to specific events rather than following a strict linear progression, can be difficult to capture fully in Event Storming without a clear narrative.

![event storming](/blog/2025/2025-05-24/image.png)

The diagram’s use of the label "query"—colored green like a read model—raises ambiguity about its intent. This highlights a common challenge in event storming: while colors and labels (e.g., orange for events, green for read models) guide understanding, they aren’t strict rules. Variations in naming—such as "context," "external system," or "system"—reflect the method's flexibility but can lead to confusion, especially for newcomers.

### UML

UML, particularly sequence diagrams, is a widely known tool that clearly captures important system information, reducing misinterpretation. While it may not have the flexibility of Event Storming, it offers precision in representing system interactions. Unlike Event Storming, where ambiguity can arise regarding parallel or sequential events, UML sequence diagrams provide a clear structure for understanding event flows and interactions within a system.

![uml sequence diagram](/blog/2025/2025-05-24/image-1.png)


### Domain Message Flow Modelling

Domain Message Flow Modelling, introduced by Nick Tune in 2020, provides a visual method for representing the flow of messages—commands, events, and queries—within a bounded context architecture. While bounded contexts define system boundaries, clear message interactions between them are equally critical for designing loosely-coupled systems.

A Domain Message Flow Diagram illustrates how messages move between actors, bounded contexts, and external systems within a given scenario. Two modeling styles exist: simple and advanced.


#### Domain Message Flow Modelling - Simple version

![Domain message flow modelling (simple)](/blog/2025/2025-05-24/image-3.png)

The simple version minimizes complexity by treating all messages uniformly, without distinguishing between commands, events, or queries. It is especially effective for teaching or early-stage modeling, where the focus is on directional message flow rather than message type.

#### Domain Message Flow Modelling - Advanced version

![Domain message flow modelling (advanced)](/blog/2025/2025-05-24/image-4.png)

The advanced version introduces distinct notations and color coding for each message type. This format supports pattern recognition for experienced practitioners, making it easier to spot anti-patterns or unintended relationships—such as events incorrectly implying direct communication between contexts. Events are visually decoupled from commands to emphasize their broadcast nature and optional consumption.

Overall, the model evolves in complexity with user expertise, balancing clarity with expressiveness depending on the scenario and audience.

### Event modeling

Event modeling is a structured approach to visualizing message flows (commands, queries, events) in a system, focusing on user experience (UX) over user interface (UI). It builds on event storming, providing more detail for implementation.

![Event Modelling](/blog/2025/2025-05-24/image-7.png)


Key Points:
- Complexity: The use of swim lanes and various elements can be overwhelming but becomes easier with experience, especially for those familiar with event storming.
- UI vs. UX: Focuses on backend logic flexibility, ensuring it’s not tightly coupled to UI changes.
- Detail & Scope: Closer to implementation, event modeling drives development by focusing on data transfer and the structure of messages.
- Event Storming Integration: Event modeling complements event storming by adding detailed structures to the high-level event flows.
- Event Sourcing & CQRS: Event modeling naturally leads to these concepts but may not fit every use case.
- Collaboration: Less collaborative than event storming, as its structured nature limits group adaptability, especially for representing parallel processes.

Event modeling is great for detailed system insights and guiding implementation, but it’s more structured and less collaborative than event storming. It’s ideal for teams needing clarity and practical design.

It's kind of in between the two :  a bit less structure than UML but a bit more structure than event  storming

### Service Blueprints: Bridging Service Design and Domain-Driven Design

![Service Blueprint](/blog/2025/2025-05-24/image-8.png)

The concept of a service blueprint is discussed, with an emphasis on its flow and structure. Currently, there is exploration into how a service blueprint can be used, particularly in contrast to the concept of bounded contexts. The discussion highlights that service blueprints offer a more high-level view compared to bounded contexts, which are more focused on implementation details.

Service blueprints are often seen as end-to-end services, not confined to specific technical aspects. For example, when applied to an online shopping service, the blueprint can span multiple bounded contexts, each of which might represent different actions in the process. However, there is a distinction to be made: while bounded contexts are more related to the technical implementation, service blueprints reflect the broader user experience and the problem being solved.

The service blueprint appears to be more aligned with strategic, enterprise-level perspectives, addressing product and portfolio levels, rather than delving into specific technical implementation. Nevertheless, it is suggested that it should still be possible to drill down to more detailed levels within this framework.

A potential future meetup could explore the connection between domain-driven design and service design, using the service blueprint as a means to bridge the gap between these two fields. This idea is reminiscent of a talk given by Susan Kaiser at DDD Europe, which connected Wardley mapping to bounded contexts and service design. This presentation was well-received, offering a wealth of insights into how these concepts can be integrated.


## Feedbacks and questions

### Structure vs Chaos

Message flow diagrams require manual layout of contexts and messages, which can be cognitively demanding. Unlike UML sequence diagrams—where layout is automated and strictly structured—this approach offers more flexibility but also introduces complexity. The freeform nature of message flow modelling allows designers to emphasize coupling and architectural patterns that might remain hidden in rigid, structured diagrams.

One observed insight is that message flow modelling, while harder to approach initially, can reveal deeper system behaviors over time. In contrast to event storming, which starts directly with events, message flow diagrams demand more deliberate effort to establish conceptual clarity.

A key heuristic mentioned is the value of maintaining openness and avoiding premature structure. Chaotic or unstructured approaches can generate insights that structured methods may suppress. For instance, recognizing repeated command patterns or identifying an overreliance on queries may point to architectural anti-patterns.

UML diagrams, by virtue of their structured format, can obscure such insights. Message flow diagrams, however, make it easier to spot an excessive number of commands or queries, which can reveal unintended tight coupling between components. A high volume of queries often indicates a query-driven architecture—a typical trait of a distributed monolith—where runtime coupling introduces fragility. If one service fails in such a query chain, the entire system may collapse.


### Balancing Structure and Complexity

Structuring a diagram can offer valuable feedback when it reveals difficulties in organizing the model, which may reflect deeper system issues. However, not all complexity is meaningful. Some effort spent on structuring may simply introduce accidental complexity without delivering additional insight.

Ultimately, the choice between structured or freeform modeling techniques depends on the goals of the session. Flexibility supports discovery, while structure provides clarity—but at the potential cost of hiding design flaws.

### System vs Bounded Context

#### What is external

The distinction between a system and a bounded context in Domain-Driven Design (DDD) often leads to some confusion. A bounded context refers to a conceptual boundary around a model and a shared language, while a system typically includes both bounded contexts and external elements that support the operation of a domain.

In some cases, such as a website, it is possible to have several bounded contexts within a single system. For example, the website might have distinct areas, such as a user authentication context, a shopping cart context, or a product catalog context. Each of these could be modeled as separate bounded contexts, even though they all belong to the same system (the website).

In simpler terms, a system is anything that is not a bounded context. A website, for instance, is often not considered a bounded context in the DDD sense, as it typically serves as a user-facing front-end without embedding core business logic. Its primary role is to expose the domain to users without handling complex domain rules, which are typically managed in back-end services or microservices.

Thus, a system could be thought of as an application or external system, where the term is used more loosely to describe things like a website or mobile app.

#### Simplicity vs Precision: Balancing Notation

The conversation then shifts to the trade-off between simplicity and precision in modeling. The more notation added to a diagram, the more complex the model becomes, as there are more concepts to understand. However, simplifying the model too much may lead to ambiguity, as in the case where a "system" could mean many different things.

It becomes clear that adding more notation might initially seem complex but could result in a more precise and clearer understanding of the system. In contrast, a simple model might look cleaner but may lack the necessary detail to fully convey the design intent. This ties back to the idea that the value of notation is emergent—use what’s needed when it’s needed, starting simple and expanding from there.

#### Flexibility, Structure, and Purpose of Notation

Three key principles emerge from the discussion:
1. Simplicity vs Precision: The balance between fewer concepts for simplicity and more for precision.
2. Structure vs Flexibility: The choice between a structured approach (like UML) and the flexibility of more freeform models (like message flow diagrams). The more flexible the notation, the more it can adapt to the problem at hand, but it may be harder to communicate.
3. Design Tool vs Documentation Tool: Whether the tool is primarily for design or documentation influences how much flexibility is needed. For design purposes, flexibility is crucial to accommodate new and evolving ideas. For documentation, consistency and structure may take precedence to ensure clarity and understanding across teams.

In summary, the design of a model should balance flexibility with clarity, adapting to the needs of the problem while maintaining a level of consistency for communication.

## Canvas

When working on a big picture discovery, the outcome is often somewhat blurry. The direction or end result may not be clear from the start. However, if the goal is to model bounded contexts, the outcomes become more defined and achievable.


![Bounded context canvas](/blog/2025/2025-05-24/image-5.png)

In such cases, the workshop could focus on creating a **bounded context canvas**. The objective may be to identify all commands, queries, and events related to a specific bounded context—both those that come into the context and those that leave it. This is a clear, attainable goal for the workshop. Alternatively, if multiple bounded contexts are involved, the scope might expand to creating canvases for each of them.

To design a workshop with this objective, it's essential to determine what is needed for the desired outcome. For instance, if an event storming workshop has already been conducted and bounded context boundaries have been identified, that could serve as the starting point for this exercise. At that point, the notation for the workshop must be defined. This could include symbols for the bounded context, commands, queries, and events.

The process would then involve considering the use cases—what actions the bounded context is responsible for. For example, tasks like accepting payments, rejecting payments, or allowing the user to create a new credit card would be modeled. The focus is on identifying and mapping the flow of all commands, queries, and events that enter or exit the bounded context, staying at a high level of abstraction.

### Adjusting the Level of Detail

In some cases, more detail might be necessary. If there’s uncertainty whether a particular action should be modeled as an event or a command, it might be helpful to dive deeper into the internal workings of the bounded context. For example, the inclusion of a process manager may be under consideration, and before finalizing its interface, understanding its internal processes could be essential.

The level of detail and the notation used will evolve as the workshop progresses. Early on, a defined set of notations is followed with little flexibility. As participants become more advanced with the tools, however, the approach becomes more adaptive. The right level of detail and the appropriate notations must be chosen as the workshop unfolds, making the process more dynamic and less predictable.

### Creativity and Adaptation at Advanced Levels

The most exciting part of this process often comes when participants reach the advanced level. At this stage, the tools become flexible, allowing for more creativity. Rather than strictly following predefined methods, the goal is to adapt and tailor the tools to the specific needs of the context. This adaptability makes the process of designing bounded contexts both challenging and rewarding.

### Choosing Between Wardley Mapping and Event Storming

Deciding when to use Wardley mapping or event storming depends on the context and goals of the company. Event storming is detailed, focusing on system events, while Wardley mapping provides a high-level strategic overview of the business landscape.

Starting with tools like Wardley mapping or the business model canvas can help clarify the company’s goals, services, and dependencies, setting the stage for more detailed work. If these initial sessions are successful, event storming can be used to dive deeper into specific challenges.

While event storming uncovers numerous issues, it can be overwhelming to prioritize them. This is where Wardley mapping is helpful, offering a strategic view to focus on key business initiatives.

Both techniques operate at different levels of abstraction, with Wardley mapping applicable to entire organizations or specific systems, and event storming scalable from big-picture to granular analysis. The choice of which to start with depends on whether the goal is to gather details or define strategic priorities.

### Story Mapping Technique: Problem vs. Solution Space

User story mapping helps organize tasks around user journeys but mainly addresses the problem space, focusing on what users do. It lacks the broader context and flexibility needed to explore solutions.

Event storming, on the other hand, captures both problem and solution spaces by modeling events and interactions. It provides a more complete view of user and business processes, making it better for designing solutions.

In short:
Story mapping is task-focused and problem-oriented;
Event storming is event-driven and solution-inclusive




## Event Storming Workshop: Adaptive Cruise Control

In this workshop, we explored a practical example using **event storming** to model the behavior of an *Adaptive Cruise Control (ACC)* system in vehicles. Here's a cleaned-up walkthrough of the early stages of our session.

---

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