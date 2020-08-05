//
//  MSTGraph.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-08-03.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

struct MSTGraph {
    let source: Int
    let dest: Int
    let weight: Int
}

extension MSTGraph: Comparable, Hashable {
    
    static func < (lhs: MSTGraph, rhs: MSTGraph) -> Bool {
        return lhs.weight < rhs.weight
    }
    static func == (lhs: MSTGraph, rhs: MSTGraph) -> Bool {
        return lhs.weight == rhs.weight
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(weight)
    }
}
