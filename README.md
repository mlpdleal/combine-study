# Learning Combine with Swift

## What is Combine?

* Declarative Swift API 
* Processing values over time
* Publisher
* Subscriber
* Centralized event processing

## Reactive Programing

According Wikipedia, reactive programming is a declarative programming paradigm concerned with data streams and the propagation of change, so, reactive programming is based in data streams with inferred dependency. Reactive programming is dividing in three parts:

* Observable
* Observer
* Scheduler

## Declarative takes care of states

* You declare the possibles states of your app
* You don't write the code to move between the states

## Combine -> SwiftUI

* Publisher -> @Binding
* Subscriber -> @State
* Operator -> @ObservedObject

## Advantages of Combine

* Combine is made for performance
* Plays nice with SwiftUI
* Easier to read and maintain (Mantainable)

## Disadvantages of Combine

* iOS and iPadOS 13, macOS Catalina, or later
* Not as mature as RxSwift
* Small set of available sinks and publisers

# Combine Fundamentals

## Combine lifecycle - Subscribers and Publishers

![Data_flow](https://user-images.githubusercontent.com/20096045/201734042-a1876273-508d-4b4c-8b41-5aeb444db093.png)

## Subscriber Orchestrates the Workflow

* Subscriber-driver framework
* Through backpressure, subscriber decides how much to ingest
* All subscribers conform to Cancelable protocol

## The Publisher Protocol

* Contract to transmit sequence of values
* Has two possible outcomes: output and failure
* Values transmitted over time
* Values only transmitted if one of more subscribers
* Can also terminate with an explict completion signal

## Operators: Combine's Business Logic

* Play a central role in the Combine framework ecosystem
* Filter and manipulate values from an upstream publisher
* Each operator returns a new publisher
* Can be chained to add processing steps
* Perform error handling, buffering, prefetches

## Consuming Data with Subscribers

* Contract to receive sequence of values
* Has two possible outcomes, input and failure
* Continues to receive as publisher transmits
* sink and .assign for receive values
* Conform to AnyCancellable protocol

## The Subject Protocol
 
* A publisher that exposes a method for outside callers to publish elements
* Common for bridginf code from the old imperative world into the modern, new Combine world
* .send() method used to emit select values to one or more subscribers 
* As an aggregator for multiple subscribers, via subscriber demands signaling unlimited demand from connected publishers
* currentValueSubject persists initial state values for subscribers, unlike passthroughSubject

## Future 

* Results in single output or failure
* Wraps an asynchronous call
* Commonly used to make a single request/response
* Promise in a closure type that accpets a result consisting of a single value from future or falure

# Work with Rest APIs

## URLSession

* Instance method, dataTaskPublisher
* Two variants, allowing you to pass in either a URLRequest or URL and returning a DataTaskPublisher

## Handling Errors in Combine

* Declare in advance a typed error definition
* Handle expected errors using mapError operator
* Handle network errors using retry operator
* Catch errors or use ReplaceError to completely ignore the error

# Advanced Concepts

## Managing Threads with Schedulers

### Scheduler Protocol

* Defines when and how to execute a closure
* Applied upstream with publishers or downstream via subscription
* Two common types of operators for orchestrating thread or queue: receive(on: ) and subscribe(on: )
* .delay, .throttle, and .debounce also support the scheduler protocol
* Goal is to perform heavy computation on a background thread but all UI-related tasks on the main thread

## Back Presure 

* Subscriber-centric pull design
* Subscriber requests values and demands how much
* You control the backpressure (demand) flow to ingest how much you can handle
* Demand is increased incrementally each time new value is received by subscriber

## Type Erasures

* Swift has access controls to restrict access to structs, classes, methods, or properties
* Combine has type erasures to obfuscate inner workings of publishers
* AnyPublisher struct, conforming to Publisher protocol
* Cannot add values to AnyPublisher via .send()

# Reference

* https://developer.apple.com/documentation/combine
* https://www.linkedin.com/learning/learning-combine-with-swift/



