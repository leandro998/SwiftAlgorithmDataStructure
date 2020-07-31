//
//  PartitionLabels.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-30.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

func partitionLabels(_ S: String) -> [Int] {
    var parts = [Int]()
    let sArray = Array(S)
    var searchIndex = 0
    var nextPart = true
    
    while searchIndex < sArray.count {
        //base case if searchIndex is the last before stopping
        if let lastIndex = parts.last, searchIndex > lastIndex {
            nextPart = true
        }
        
        let c = sArray[searchIndex]
        //if it is last part, not necessary to continue
        for i in stride(from: sArray.count - 1, through: 0, by: -1) {
            if let lastIndex = parts.last, i <= lastIndex { break }
            if c == sArray[i] {
                if nextPart == true {
                    parts.append(i)
                    nextPart = false
                } else {
                    //update last one
                    parts.removeLast()
                    parts.append(i)
                }
                break
            }
        }
        searchIndex += 1
    }
    
    var local = parts[0]
    var result = [Int]()
    for e in parts {
        if e == local {
            result.append(e + 1)
        } else {
            result.append(e - local)
        }
        local = e
    }
    
    return result
}


