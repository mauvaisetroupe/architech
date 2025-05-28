---
title: Application attributes
type: docs
---

Today in designIT, there are 4 fields to qualify entities of type Application:

## ApplicationType

Not all applications in designIT are strictly applications in the traditional sense. They should be renamed with another term (yet to be defined). ApplicationType allows choosing between:

```java
public enum ApplicationType {
    SOFTWARE,
    MIDDLEWARE,
    HARDWARE,
    PARTNER,
    ACTOR,
    OTHER,
}
```
- ACTOR is a typically a user as you will use it in a bpmn process or a dequence diagaram. Could be a customer, a relationship manager, etc
- Partner is typically an external actor, a parter company, etc..

## SoftwareType

In the case where ApplicationType is SOFTWARE or MIDDLEWARE, we can use SoftwareType 

We can use SoftwareType to describe whether we have:
- A custom-developed application, or if it's a commercial off-the-shelf (COTS) product.
- And whether it is deployed on-premise or in the cloud.

```java
public enum SoftwareType {
    ON_PREMISE_COTS,
    ON_PREMISE_CUSTOM,
    CLOUD_CUSTOM,
    CLOUD_SAAS,
    CLOUD_THIRD_PARTY,
    ON_PREMISE_EXTERNAL_LIBRARY,
}
```

The difference between CLOUD_SAAS and CLOUD_THIRD_PARTY is that 
- SAAS (Software as a Service) remains an application used by internal personnel of the company, 
- while THIRD_PARTY is an application used by personnel of the company that provides the software (a sort of BPO, Business Process Outsourcing).

## Technologies

In designIT, it's possible to associate technologies with an application. It's not about being exhaustive or too precise; designIT isn't a CMDB (Configuration Management Database) but rather focuses on more high-level aspects. For instance, it can be used to express that an application is built with Java and Spring, or to indicate frameworks used such as Spring Boot.

This field should be used based on what makes sense and adds value to the company. Too much detail can be complex and costly to maintain, while too little detail may not provide value.

## ApplicationCategory

This attribute allows tagging applications. For example, it can qualify:
- Frontend or backend applications,
- Business vs. technical applications,
- Or any other characteristics.

The idea is to see this field as a generic label and to view the values as hashtags on social networks.