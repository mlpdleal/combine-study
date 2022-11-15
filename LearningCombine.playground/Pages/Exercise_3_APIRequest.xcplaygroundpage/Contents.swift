//: [Previous](@previous)

import Foundation
import Combine

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

let emptyPost = Post(userId: 1, id: 1, title: "Empty", body: "No results")

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
let publisher = URLSession.shared.dataTaskPublisher(for: url!)
    .map { $0.data }
    .decode(type: Array<Post>.self, decoder: JSONDecoder())
    .map {$0.first }
    .replaceNil(with: emptyPost)
    .compactMap({ $0.title })

let cancellable = publisher
    .sink(receiveCompletion: { completion in
        print(String(describing: completion))
    }, receiveValue: { value in
        print(value)
    })
