//
//  Stack.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-08.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//  implementing stack: https://www.raywenderlich.com/800-swift-algorithm-club-swift-stack-data-structure
//  Google books: https://books.google.ca/books?id=fhiMDQAAQBAJ&pg=PT435&lpg=PT435&dq=stack+iterator+swift&source=bl&ots=f8u9Hk8QVm&sig=ACfU3U2iHUgm_n6fb_aowpE435ZgyfEazw&hl=pt-BR&sa=X&ved=2ahUKEwjJmZaCvMPqAhVfFjQIHUTQDToQ6AEwAXoECAkQAQ#v=onepage&q=stack%20iterator%20swift&f=false
//


import Foundation

/// This is **Stack** class. Represents a stack of generic items
/// The *push*, *isEmpty*, and *count* operations take constant time *O(1)*. Iteration takes linear time *O(n)*
struct Stack<E>: Sequence {
    private var items = [E]()
    
    //number of elements in stack
    private(set) var count: Int = 0
    
    //returns true if stack is empty, otherwise false.
//    public func isEmpty() -> Bool {
//        if items == nil { return true }
//    }
    
    //helper linked list node class
//    fileprivate class Node<E> {
//        fileprivate var item: E
//        fileprivate var next: Node<E>?
//        fileprivate init(item: E, next: Node<E>? = nil) {
//            self.item = item
//            self.next = next
//        }
//    }
    
    //push an item to the stack
    mutating func push(item: E) {
        items.append(item)
        count += 1
    }
    
    //pop an item out of the stack
    mutating func pop() -> E? {
        return items.popLast()
    }
    
    //peek to see the last item
    func peek() -> E? {
        return items.last
    }
    
    //StackIterator that iterates over the item in this stack in arbitrary order
    public struct StackIterator<E> : IteratorProtocol {
        private var current: E?

        fileprivate init(_ items: E?) {
            self.current = items
        }

        public mutating func next() -> E? {
            if let element = current.self {
                return element
            }
            return nil
        }

        //this needs to exist to give the name of the type
        public typealias Element = E
    }
    
    public func makeIterator() -> StackIterator<E> {
        return StackIterator(self as? E)
    }
    
}

//necessary to call print(stack) on main, otherwise will show only the address of stack
extension Stack: CustomStringConvertible {
    public var description: String {
        return "\(items)"
    }
}
