---
title: "Excel column mapping"
type: docs
weight: 30

# permalink: /excel-mapping/
# parent: Excel import/export
# nav_order: 3
---

# Mapping Excel / Data Model

Find below the mapping between Excel column names and Entities field names

> see a full example here (https://github.com/mauvaisetroupe/ea-design-it/tree/main/docs/excel-import/samples)

## Applications

This mapping concerns import for Application via Excel


| Excel Column Name       | Application Entity |
|-------------------------|--------------------|
| application.id          | alias              |
| application.name        | name               |
| application.description | description        |
| application.comment     | comment            |
| application.documentation| documentationURL  |
| (No direct mapping)     | startDate          |
| (No direct mapping)     | endDate            |
| application.type        | applicationType    |
| software.type           | softwareType       |
| application.nickname    | nickname           |
| owner                   | owner              |
| it.owner                | itOwner            |
| business.owner          | businessOwner      |
| application.category.*  | categories         |
| application.technology.*| technologies       |
| externalID.*            | externalIDS        |



## Landscape, Functional flow, Interfaces 

This mapping concerns import Landscape via Excel


| Excel Column Name            | FunctionalFlow Entity| FlowInterface Entity  | FunctionalFlowStep Entity |
|------------------------------|----------------------|-----------------------|-----------------------|
| Id flow                      |                      | alias                 |                       |
| Alias flow                   | alias                |                       |                       |
| Source Element               |                      | source.name or sourceComponent.name |         |
| Target Element               |                      | target.name or targetComponent.name |         |
| Description                  | description          |                       |                       |
| StepDescription              |                      |                       | description           |
| Integration pattern          |                      | protocol              |                       |
| Frequency                    |                      |                       |                       |
| Format                       |                      |                       |                       |
| Status flow                  | status               |                       |                       |
| Comment                      | comment              |                       |                       |


