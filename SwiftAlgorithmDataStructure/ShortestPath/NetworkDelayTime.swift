//
//  NetworkDelayTime.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-08-06.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//  www.cnblogs.com/strengthen/p/10525029.html
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
    var delayTimes = Array(repeating: Int.max, count: N)
    delayTimes[K - 1] = 0
    
    var nodeLeft = Array(repeating: 1, count: N)
    
    while true {
        var closest = Int.max
        var closestIndex = -1
        for i in 0..<nodeLeft.count {
            if nodeLeft[i] != 0 && delayTimes[i] < closest {
                closest = delayTimes[i]
                closest = i + 1
            }
        }
        
        if closestIndex == -1 {
            break
        }
        
        for i in 0..<times.count {
            if times[i][0] == closestIndex {
                delayTimes[times[i][1] - 1] = min(delayTimes[times[i][1] - 1], delayTimes[times[i][0] - 1] + times[i][2])
            }
        }
        
        nodeLeft[closestIndex - 1] = 0
    }
    
    return delayTimes.max()! == Int.max ? -1 : delayTimes.max()!
}

/*
func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
    // input example: times = [[2,1,1],[2,3,1],[3,4,1]], N = 4, K = 2
    var res = 0
    var edges = [Int:[(Int, Int)]]()
    var dist = [Int](repeating: Int.max, count: N + 1)
    var q = [K]
    
    for e in times {
        edges[e[0], default:[(Int, Int)]()].append((e[1], e[2]))
    }
    
    while !q.isEmpty {
        let u = q.first!
        q.removeFirst()
        var visited = Set<Int>()
        
        for (v, w) in edges[u, default:[(Int, Int)]()] {
            //v = target node (2 value) | w = weight (3 value) | u = from node (1 value)
            //var u will loop from 2, 2, 3 until it is empty and will break out of the loop
            if dist[u] != Int.max && dist[u] + w < dist[v] {
                dist[v] = dist[u] + w
                if visited.contains(v) { continue }
                visited.insert(v)
                q.append(v)
            } //end if
        } //end for (key, value)
    } //end while loop
    
    for i in 1...N {
        res = max(res, dist[i])
    }
    
    return res == Int.max ? -1 : res //if the result is equal to maximum Int, there is no answer
}

*/
