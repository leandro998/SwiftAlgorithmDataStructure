//
//  Bag.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-08.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

/// This is **Bag** class. Represents a bag of generic items
/// It supports insertion and iterating over the items in arbitrary order.
/// This implementation uses a singly-linked list with inner class Node.
/// The *add*, isEmpty, and *count* operations take constant time *O(1)*. Iteration takes linear time *O(n)*
public final class Bag<E> : Sequence {
    //this represents the beggining of bag
    private var first: Node<E>? = nil
    
    //number of elements in bag
    private(set) var count: Int = 0
    
    //helper linked list node class
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    //Initialize and empty bag
    init() {}
    
    //returns true if bag is empty, otherwise false.
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    //adds an item to the bag
    public func add(item: E) {
        let oldFirst = first
        first = Node<E>(item: item, next: oldFirst)
        count += 1
    }
    
    //BagIterator that iterates over the item in this bag in arbitrary order
    public struct BagIterator<E> : IteratorProtocol {
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
        
        //this needs to exist to give the name of the type
        public typealias Element = E
    }
    
    public func makeIterator() -> some IteratorProtocol {
        return BagIterator<E>(first)
    }
    
}

//necessary to call print(bag) on main, otherwise will show only the address of bag
extension Bag: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1), "}
    }
}
