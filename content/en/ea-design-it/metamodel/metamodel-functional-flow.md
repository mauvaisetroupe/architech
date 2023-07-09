---
title: "Functional Flow"
type: docs
# url: /metamodel/functional-flow/
weight: 30
# parent: MetaModel
---

# Functional Flow

## Teminology 

In the context of a **Landscape**, a Functional Flow represents a functional information exchange between two or more applications

FunctionalFlow is a list of **steps**, each step leverages on an [Interface](../metamodel-interface)

## Example

**S.01** is FunctionalFlow that describes interactions between applications for "Instruments Prices Feeding".

It is composed of 3 steps :
- Securities Partner send prices to Trading Platfom via the Security Master File
- Trading Platform synchronize the prices to the Core Banking Sysetm
- Core Banking Sysetm confirm the reception of prices to the Trading Platform

![landscape as set of flows](../png/flow.png)



![landscape as set of flows](../png/flow-steps.png)

# Mapping with Archimate specification

Basically, a Functional Flow is a subset of Landscape, representing a specific usage of a part of the landscape in a specific functional use case.

Like Landscape, a Functional Flow is typically an **Application Cooperation Viewpoint**.

![landscape archimate](../jpg/functional-flow.jpg)

