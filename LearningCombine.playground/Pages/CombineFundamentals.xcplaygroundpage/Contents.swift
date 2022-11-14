//: [Previous](@previous)

import Foundation
import Combine
import SwiftUI

// (1) A simple publisher using Just, to produce once for each subscriber

let _ = Just("Hello world")
    .sink{ (value) in
        print("value is \(value)")
    }

// (2) Taking advantage of NotificationCenter's publisher

let notification = Notification(name: .NSSystemClockDidChange, object: nil, userInfo: nil)

let notificationClockPublisher = NotificationCenter.default.publisher(for: .NSSystemClockDidChange)
    .sink(receiveValue: { (value) in
        print("value is \(value)")
    })

NotificationCenter.default.post(notification)


// (1) Create a new Publisher operator, to square each value, using map()

[1, 5, 9]
    .publisher
    .map { $0 * $0 }
    .sink{ print($0)}

// (2) Use decode() with map to convert a REST responses to an object

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

struct Task: Decodable{
    let id: Int
    let title: String
    let userId: Int
    let body: String
}

// send http request (publisher)

let dataPublisher = URLSession.shared.dataTaskPublisher(for: url)
    .map{ $0.data }
    .decode(type: [Task].self, decoder: JSONDecoder())

// get the result of the request (subscriber)

let cancellableSink = dataPublisher
    .sink(receiveCompletion: { completion in
        print(completion)
    }, receiveValue: { items in
        print("Result \(items[0].title)")
    })

// (1) Create a new Just publisher, map some text as prefix, and assign to label
[1,5,9]
    .publisher
    .sink{ print($0)}



