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


# Reference

* https://developer.apple.com/documentation/combine
* https://www.linkedin.com/learning/learning-combine-with-swift/



