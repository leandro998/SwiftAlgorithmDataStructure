//
//  TwoCitySchedule.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-29.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

func twoCity(_ costs: [[Int]]) -> Int {
    var sumA = 0 /* costs.reduce(0) { $0 + $1[0] } */
    var diff = [Int]()
    
    for cost in costs {
        sumA += cost[0]
        diff.append(cost[1] - cost[0])
    }
    
    diff.sort() // O(n log n)
    for b in diff[0..<diff.count/2] {
        sumA += diff[b]
    }
    return sumA
}

/*
func flyPeople(_ people: Int, _ cost: [[Int]]) -> [[Int]] {
    var cityA = [[Int]]()
    var cityB = [[Int]]()
    var n: Int = 0
    
    while n < people {
        for p in cost {
            let opt1 = p[0]
            let opt2 = p[1]
            if opt1 < opt2 {
                cityA[n].append(opt1) //not working
                n += 1
            } else {
                cityB[n].append(opt2)
                n += 1
            }
            
        }
    }
    
    cityA.append(contentsOf: cityB)
    
    return cityA
}
*/
