---
title: Introduction
type: docs
weight: 5
---


**EADesignIt** is a lightweight, open-source Enterprise Architecture software designed to enhance visibility into your assets, their connections, and their characteristics. This tool is tailored for Enterprise Architects who seek to document the state of their organizations with minimal effort, replacing cumbersome Excel files with a more efficient database repository.

You can find the source code for [EADesignIt at GitHub](https://github.com/mauvaisetroupe/ea-design-it)

## Product Philosophy

Based on the observation that building an enterprise-wide assets repository is a costly activity and that maintaining a fine-grained reference manually could turn into a nightmare, the idea behind **EADesignIt** is to offer the possibility to complete a high-level top-down process by a more automatic-feeding bottom-up approach.

![approach](./images/top-bottom.svg)

That's why, even if it's possible to create all entities (applications, interfaces, etc.) via the GUI, the philosophy of the software is to offer an Excel import/export mechanism as a first-class citizen feature.

For the same reason, offering an API over the database to add custom processes/tools to populate the database is an essential part of the solution.

## Data model

If you want to know if **EADesignIt** is appropriate for your context, the most important aspect is to know if the data model could meet your requirements. To achieve this, please read the [description of data model](../metamodel/). 

You can also consult the [JDL file](https://github.com/mauvaisetroupe/ea-design-it/blob/main/jhipster-jdl-metamodel.jdl) for a more accurate and detailed view of the entities and their relationships (you can use [jdl studio](https://start.jhipster.tech/jdl-studio/) and import the JDL file).

## Diagramming or Not Diagramming?

This application is not an architecture diagram tool. It should preferably be considered as a database repository.

Diagram capabilities come in two forms.

### PlantUML

**EADesignIt** uses [PlantUML](https://www.plantuml.com) for real-time visualization. It generates a UML components diagram to expose applications and their integrations.

Example of generated PlantUML diagram:

![interface view](./application/screenshot-plantuml.png)

### Drawio

**EADesignIt** also generates editable diagrams using [Drawio](https://drawio-app.com). Like the one generated on-the-fly with PlantUML, this schema represents applications and their interfaces. But with this Drawio feature, you can also easily edit and customize the generated schema and save it in your database.

If you add a new application to your landscape, **EADesignIt** will add this additional component to your Drawio landscape diagram without losing the formatting you've previously done.

Example of generated and editable Draw.io diagram:

![Interface View](./application/screenshot-drawio.png)

## Build the application

This application is build with Java, Spring Boot and VueJS.

It's based on JHipster to generate all entities. Please refer to [documentation](https://github.com/mauvaisetroupe/ea-design-it/blob/main/docs/jhipster/jhipster.md).

## Run the Application

A more convenient approach is to utilize a Docker image. You can find the image at the following URL: [Docker Image](https://hub.docker.com/repository/docker/mauvaisetroupe/ea-design-it/).

## What's next ?

> **NEXT** : If you want to continue explore EADesigntIt : [Getting started section](../getting-started/).