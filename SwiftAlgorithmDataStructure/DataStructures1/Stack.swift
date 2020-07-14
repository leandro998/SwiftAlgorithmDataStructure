//
//  Stack.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-08.
//  Copyright © 2020 Leandro Prado. All rights reserved.

import Foundation

/// The Stack class represents a last-in-first-out (LIFO) stack of generic items.
/// It supports the usual *push* and *pop* operations, along with methods for peeking at the top item, testing if the stack is empty, and iterating through the items in LIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.
public final class Stack<E> : Sequence {
    /// top of stack
    private var first: Node<E>? = nil
    /// size of the stack
    private(set) var count: Int = 0
    
    /// helper linked list node class
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    /// Initializes an empty stack.
    public init() {}
    
    /// Adds the item to this stack
    /// - Parameter item: the item to add
    public func push(item: E) {
        let oldFirst = first
        first = Node<E>(item: item, next: oldFirst)
        count += 1
    }
    
    /// Removes and returns the item most recently added to this stack.
    public func pop() -> E? {
        if let item = first?.item {
            first = first?.next
            count -= 1
            return item
        }
        return nil
    }
    
    /// Returns (but does not remove) the item most recently added to this stack.
    public func peek() -> E? {
        return first?.item
    }
    
    /// Returns true if this stack is empty.
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    /// StackIterator that iterates over the items in LIFO order.
    public struct StackIterator<E> : IteratorProtocol {
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            self.current = first
        }
        
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.next
                return item
            }
            return nil
        }
        
        public typealias Element = E
    }
    
    /// Returns an iterator that iterates over the items in this Stack in LIFO order.
    public __consuming func makeIterator() -> StackIterator<E> {
        return StackIterator<E>(first)
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) " }
    }
}



// ----------done by myself with help of tutorials ---------------
//  implementing stack: https://www.raywenderlich.com/800-swift-algorithm-club-swift-stack-data-structure
//  Google books: https://books.google.ca/books?id=fhiMDQAAQBAJ&pg=PT435&lpg=PT435&dq=stack+iterator+swift&source=bl&ots=f8u9Hk8QVm&sig=ACfU3U2iHUgm_n6fb_aowpE435ZgyfEazw&hl=pt-BR&sa=X&ved=2ahUKEwjJmZaCvMPqAhVfFjQIHUTQDToQ6AEwAXoECAkQAQ#v=onepage&q=stack%20iterator%20swift&f=false
//

/* import Foundation

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
*/
