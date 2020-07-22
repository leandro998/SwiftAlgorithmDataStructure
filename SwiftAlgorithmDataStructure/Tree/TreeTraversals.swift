//
//  TreeTraversals.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-10.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

func preOrder(_ node: Int) {
    if node == -1 { return }
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
    preOrder(tree[node][0])
    preOrder(tree[node][1])
}

func inOrder(_ node: Int) {
    if node == -1 { return }
    preOrder(tree[node][0])
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
    preOrder(tree[node][1])
}

func postOrder(_ node: Int) {
    if node == -1 { return }
    preOrder(tree[node][0])
    preOrder(tree[node][1])
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
}

//global variable:
var tree = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 26)

func treeTraversals() {
    //get user input:
    let n = Int(readLine()!)!
    
    for _ in 0..<n {
        let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
        // A, B, C ... Z
        let x = Int(Character(nodeInfo[0]).asciiValue! - 65)
        let l = Int(Character(nodeInfo[1]).asciiValue!)
        let r = Int(Character(nodeInfo[2]).asciiValue!)
        
        tree[x][0] = l == 46 ? -1 : l - 65
        tree[x][1] = r == 46 ? -1 : r - 65
    }
    
    preOrder(0)
    print()
    inOrder(0)
    print()
    postOrder(0)
    print()
    
}
