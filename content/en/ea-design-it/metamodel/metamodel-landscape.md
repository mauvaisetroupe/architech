---
title: "Landscape"
type: docs
weight: 20
# permalink: /metamodel/landscape/
# nav_order: 1
# parent: MetaModel
---


## Landscape Viewpoint
IT lanscape, composed by hundred of applications and components is difficult to model. A single and comprehensive model is often too complex to be understood. 

That's why it's important to introduce views and viewpoints.

Using TOGAF terminology, A **view** is a representation of a whole system from the perspective of a related set of concerns. A **viewpoint** defines the perspective from which a view is taken. Viewpoint a kind of template, and View is an instantiation of a a specific viewpoint

This first version of the tool implement a unique ViewPoint : **Application Landscape**. As explained below, itś equivalent to Archimate **Application Cooperation Viewpoint**.

## Example

A landscape is essentially a collection of [Applications](../metamodel-application/) and the interactions between these applications. It provides a comprehensive view of the applications in a specific domain or area, along with the relationships and connections between them. This view serves as a holistic representation of how different software components work together within that domain.

[Functional Flow](../metamodel-functional-flow/), on the other hand, can be thought of as use cases that are typically represented using sequence diagrams. They describe how specific functions or processes are carried out within the landscape. Functional flows provide a detailed and step-by-step depiction of how applications interact and work together to achieve a particular task or goal.

In a more extensive perspective,  a landscape can be considered as the sum of all functional flows within a functional domain. Put differently, Landscape consolidates and integrates all the interactions, applications, and functional flows, offering a comprehensive overview that encompasses and includes all interactions and processes occurring within the landscape.

![landscape](../png/landscape.png)

In this example, Landscape in composed of 2 Functional Flows :  **GEN.001** and <mark style="background-color: yellow"><b>GEN.002</b></mark>.

![landscape as set of flows](../png/landscape-flows.png)

> **NEXT** : If you want to continue to dicover the metamodel, see what is a [Functional Flow](../metamodel-functional-flow/).

## Mapping with Archimate specification

An application landscape is typically an **Application Cooperation Viewpoint**.

<span style="background-color: blue; color: white; font-weight: bold">Archimate 3.1</span> **Architecture View** - A representation of a system from the perspective of a related set of concerns. 

<span style="background-color: blue; color: white; font-weight: bold">Archimate 3.1</span> **Architecture Viewpoint** - A specification of the conventions for a particular kind of architecture view. 

<span style="background-color: blue; color: white; font-weight: bold">Archimate 3.1</span> The **Application Cooperation Viewpoint** describes the relationships between application components in terms of the information flows between them, or in terms of the services they offer and use. This viewpoint is typically used to create an overview of the application landscape of an organization.

Application Cooperation Viewpoint used the following elements:
 - Application Components
 - Flow Relationship 

![landscape archimate](../jpg/landscape.jpg)

Interesting post with some additional information could be read [here](https://bizzdesign.com/blog/practical-archimate-viewpoints-for-the-application-layer/)

## What's next ?

> **NEXT** : If you want to continue to dicover the metamodel, see what is a [Functional Flow](../metamodel-functional-flow/).