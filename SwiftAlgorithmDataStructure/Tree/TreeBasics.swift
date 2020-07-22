//
//  TreeBasics.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-16.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//  https://www.raywenderlich.com/1053-swift-algorithm-club-swift-tree-data-structure
//

import Foundation



/*
class Node {
    var value: String
    var children: [Node] = []
    weak var parent: Node?

    init(value: String) {
        self.value = value
    }

    func add(child: Node) {
        children.append(child)
        child.parent = self
    }

}

extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(value)"

        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}
*/

//----------main call -------------
/*
let beverages = Node(value: "beverages")

let hotBeverage = Node(value: "hot")
let coldBeverage = Node(value: "cold")

let tea = Node(value: "tea")
let coffee = Node(value: "coffee")
let cocoa = Node(value: "cocoa")

let blackTea = Node(value: "black")
let greenTea = Node(value: "green")
let chaiTea = Node(value: "chai")

let soda = Node(value: "soda")
let milk = Node(value: "milk")

let gingerAle = Node(value: "ginger ale")
let bitterLemon = Node(value: "bitter lemon")

beverages.add(child: hotBeverage)
beverages.add(child: coldBeverage)

hotBeverage.add(child: tea)
hotBeverage.add(child: coffee)
hotBeverage.add(child: cocoa)

coldBeverage.add(child: soda)
coldBeverage.add(child: milk)

tea.add(child: blackTea)
tea.add(child: greenTea)
tea.add(child: chaiTea)

soda.add(child: gingerAle)
soda.add(child: bitterLemon)

print(beverages)
*/
