//
//  GasStation.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-30.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

func canCompleteCircuitIntuitive(_ gas: [Int], _ cost: [Int]) -> Int {
    let numStations = gas.count
    var possibleStarts = [Int]()
    for i in 0..<numStations {
        if gas[i] >= cost[i] {
            possibleStarts.append(i)
        }
    }
    
    while !possibleStarts.isEmpty {
        var start = possibleStarts.remove(at: 0)
        var travelCount = numStations
        var fuel = 0
        while travelCount != 0 {
            let cost = cost[start]
            fuel += gas[start]
            if fuel < cost { break }
            fuel -= cost
            start = (start + 1) % numStations
            travelCount -= 1
        }
        
        if travelCount == 0 {
            return start
        }
    }
    
    return -1
}

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    /// [].enumerated() - array of (index, value) tuples
    let gas = gas.enumerated().map { $1 - cost[$0] }
    let numStations = gas.count
    var i = 0
    var fuelSoFar = 0
    var result = 0
    while i < gas.count * 2 - 1 {
        fuelSoFar += gas[i % numStations]
        if fuelSoFar < 0 {
            result = i + 1
            if result >= numStations {
                return -1
            }
            fuelSoFar = 0
        }
        i += 1
    }
    
    return result
}

/* Aga:
func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var diffs = [Int](repeating: 0, count: gas.count)
    for i in 0..<gas.count {
        let result = gas[i] - cost[i]
        diffs[i] = result
    }
    
    var index = -1
    var count = 0
    for i in 0..<gas.count{
        var newArray = diffs[i..<diffs.count]
        newArray.append(contentsOf: diffs[0..<i])
        var sum = 0
        for v in newArray {
            sum += v
            if sum < 0 {
                break
            }
        }
        if sum >= 0{
            index = i
            break
        }
        print(newArray)
        count += 1
    }
    return count
}
*/
