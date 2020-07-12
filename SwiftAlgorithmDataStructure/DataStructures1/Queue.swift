//
//  Queue.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-08.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//  https://benoitpasquier.com/data-structure-implement-queue-swift/
//  https://www.pluralsight.com/guides/data-structures-in-swift-part-2
//

import Foundation

class Queue<E> {
    private var elements: [E] = []
    
    func enqueue(_ value: E) {
        elements.append(value)
    }
    
    func dequeue() -> E? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }
    
    var head: E? {
        return elements.first
    }
    
    var tail: E? {
        return elements.last
    }
    
    func peek() -> E? {
        return head
    }
    
}

extension Queue: CustomStringConvertible {
    var description: String {
        return "\(elements)"
    }
}

