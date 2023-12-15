---
title: "Enterprise Data Architecture"
date: 2023-11-07
tags: [Architecture, Data]
categories: [English]
---

## Context (Why)

Over the past five years, the Enterprise Architecture (EA) team I've been a part of has diligently established a comprehensive EA framework. This framework encompasses the organization, deliverables, processes, and tools. Within this context, I have developed a tool known as [designIT](/ea-design-it). Up to this point, designIT has primarily focused on the Application facet of the information system, utilizing TOGAF terminology.

Today, we are immersed in a thoughtful process aimed at reconfiguring aspects of our architecture, with a strong emphasis on data and information. This initiative involves a thorough examination of how data and information are integrated into our existing framework and how they can be optimized to better serve our organizational needs.

The main concerns we have are as follows:
1. To establish a common terminology and gain a comprehensive understanding of the data manipulated within the organization, including how this information can be deconstructed.
2. To gain insight into how this data is stored, which applications are involved, and how to identify the golden sources and replicas.

An enterprise architecture repository holds significant potential, but it comes at a cost, including the hidden cost of maintenance. If it becomes too expensive or overly complex, a diligently filled repository will inevitably drift away from the realities of the organization. There is nothing more detrimental than having an inaccurate repository. It is preferable to have an incomplete but accurate representation. Therefore, it is crucial to exercise restraint and limit the scope accordingly.

This naturally brings us to the "What" - what are the needs that must be addressed.

## Requirements (What)

### Business Requirements

| Requirement | Requirement description |
| -------------- | ------------------------ |
| BUS.01 | As an Enterprise Architect (EA) or a member of the data governance team, I want to have a clear view of Information and share it with the business. |
| BUS.02 | As an EA or Data Governance team member, I want the ability to break down Information into its components, always from a business perspective. |
| BUS.03 | As an EA or Data Governance team member, I want the ability to group Information into generic categories (e.g., Bonds, Funds, and Shares are all Securities). |

### IT Requirements

|Requirement|Requirement description|
|--------------|------------------------|
| DAT.01 | As a designer, I need to indicate in which data store specific data is stored, in which application (e.g., Customer reference data is located in CRM). |
| DAT.02 | As a designer, I need to identify the golden source and replicas data of a certain type (e.g., CustomerData@CRM is cached in CustomerData@WebBankingApp and in CustomerData@BillingApp). |
| DAT.03 | As a designer, I need to demonstrate how certain golden source data is replicated in replicas data (e.g., Functional Flow Step X takes some data as input and stores it in CRM). |
| DAT.04 | As a designer, I need to illustrate which application exposes particular data (e.g., CustomerAPI@CRM exposes customer reference data). |
| DAT.05 | As a viewer, when given specific data, I need to locate the application(s) that expose it (e.g., when searching for CustomerData, I should see that it is exposed by CRM and also by WebBanking). |

## The Proposed Model (How)

It is only logical that we have turned to ArchiMate to model these two key aspects.

### Business Object

The concept of **Business Objects** will allow us to address the business part of the requirements and provide a purely business-oriented perspective on information, especially to model Business Information (`BUS.01`)

> A Business Object, as defined in ArchiMate, could be used to represent information assets that are relevant from a business point of view and can be realized by data objects.

ArchiMate **Composition Relationship**: A Business Object can be composed of several Business Objects (e.g., Customer is composed of Address and Investor Profile) (`BUS.02`).

> ![](../../../2023-11-07/composition.png)


Archimate **Specialization Relationship**, a BusinessObject could be specialized in a particular type (ex. Bonds, Shares and Stocks are specialization of Securities) (`BUS.03`)

> ![](../../../2023-11-07/specialization.png)



### Data Object

The concept of **data objects** will facilitate the achievement of the IT-related requirements by providing a more application-specific perspective.

> A data object, as defined in ArchiMate, represents data structured for automated processing. A data object can be accessed by an application function and may realize a business object.

### Defining the Viewpoints, Concepts, and Conventions

As we have previously done for [inter-applications flows](/ea-design-it/metamodel/metamodel-interface/#mapping-with-archimate-specification), creating a architecture artefact begins with agreeing on the viewpoint to be produced.

> In the ArchiMate language, a viewpoint is a selection of a relevant subset of the ArchiMate elements and their relationships. It represents a part of an architecture expressed in different diagrams, serving as a basis for specifying stakeholder concerns.

In the case of the first data-focused Enterprise Architecture viewpoints, the goal is to have an overview of golden sources and replicas and to comprehend where data is stored and how it is transferred from one application to another.

The modeling convention we propose is as follows:

#### Data Object Realizes a Business Object

> ![](../../../2023-11-07/do-implements-bo.png)

- A Business Object is realized by one or more Data Objects (`DAT.01`)
- Business Object is the link between two different Data Objects. This link explains that Bond@SecuritiesMasterFile and Bond@CBS are two different implementations of the same business concept (`DAT.01`).

#### Application Access Data Object

> ![](../../../2023-11-07/application-access-do.png)

- A data object belongs to a single application, effectively representing the realization of the business object within a specific application.
- These data objects implemented in applications are only represented if they are stored (`DAT.01`).
- This excludes objects only manipulated by applications (e.g., web banking making a real-time call to retrieve and display credits, without storing them).
- These data objects are categorized based on the criteria of golden source or replicas (`DAT.02`).

#### Data Objects Are Transferred from Application to Application

> ![](../../../2023-11-07/do-transfert-in-applications.png)

- If the same Business Object is realized in two different applications, that means there is a transfer from the source application to the target application (`DAT.03`).
- When transferring a business object, there is usually a need for mapping the Bond@SMF object to the Bond@CBS object, somewhat akin to the process of transitioning from one bounded context to another in Domain-Driven Design (DDD).
- Indirectly, knowing all transfers from a specific application, combined with the concept of [Interface](/ea-design-it/metamodel/metamodel-interface/), describes which data is exposed by this application (`DAT.04` and `DAT.05`).

With this common set of rules, we propose to expose **two specific viewpoints**.

### #1 - Information Structure Viewpoint

It's an extension of an Archimate viewpoint called [Information Structure Viewpoint](https://pubs.opengroup.org/architecture/archimate3-doc/ch-Example-Viewpoints.html#sec-Information-Structure-Viewpoint) (that does not include links with applications).

The information structure viewpoint is comparable to the traditional information models created in the development of almost any information system. It shows the structure of the information used in the enterprise.

In this viewpoint, we expose:
- Business Objects and their internal relationships (composition and specializations).
- Associated Data Objects, their internal relationships (composition), and

 their relationships with Business Objects.
- Associated Applications and their relationships with Data Objects.


> ![](../../../2023-11-07/viepoint-1.png)


### #2 - Golden Sources and Replicas Data Objects Viewpoints

In a specific [landscape](/ea-design-it/metamodel/metamodel-landscape/), we want to understand where the data is stored, in which applications, and if the storage should be considered as a Golden Source or as a Replica.

This viewpoint exposes:
- Data Objects hosted in Applications that compose the Landscapes.
- With a clear mention if these Data Objects are golden sources or replicas.

> ![](../../../2023-11-07/viepoint-2.png)
