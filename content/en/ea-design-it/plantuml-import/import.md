---
title: "PLantuml Import"
type: docs
# permalink: /import-plantuml/flow
weight: 40
---

## Import Plantuml - FunctionalFlow

A convenient way to import a Functional Flow is using plantuml
You can describe your Functional Flow as a Sequence Diagarm

![Export Sequece Diagram](../sample.png)

```
@startuml
participant "web banking" as webbanking
participant "Payment Microservice" as payment
participant "Core Banking Sysetm" as cbs
title: "Debit card order"
webbanking -> payment: first step
payment -> cbs: second step
note right:API
@enduml
```

![Export Sequece Diagram](../sample-02.png)