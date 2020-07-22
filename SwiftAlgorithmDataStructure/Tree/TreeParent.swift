//
//  TreeParent.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Derrick Park on 7/21/20.
//  Copyright © 2020 Derrick Park. All rights reserved.

import Foundation

func findParent() {
    let n = Int(readLine()!)!
    var parent = [Bool](repeating: false, count: n)
    
    parent[0] = true
    
    var parents = [Int](repeating: 0, count: n + 1)
    
    for _ in 0..<n - 1 {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        
        if parent[u - 1] {
            parents[v] = u
            parent[v - 1] = true
        } else {
            parents[u] = v
            parent[u - 1] = true
        }
    }
    
    for i in 2...n {
        print(parents[i])
    }
}

