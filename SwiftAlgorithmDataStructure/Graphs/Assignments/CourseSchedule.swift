//
//  CourseSchedule.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-28.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var adj = [[Int]](repeating: [Int](), count: numCourses)
    var indegreeList = [Int](repeating: 0, count: numCourses)
    
    //counting the indegrees
    for edge in prerequisites {
        let start = edge[1]
        let end = edge[0]
        adj[start].append(end)
        indegreeList[end] += 1
    }
    
    //create a temporary [Int] to reverse the nodes
    var stack = [Int]()
    for x in 0..<indegreeList.count {
        if indegreeList[x] == 0 {
            stack.append(x)
        }
    }
    
    //final [Int] to compare if it is possible to study all courses
    var result = [Int]()
    while stack.count > 0 {
        let y = stack.popLast()!
        result.append(y)
        let connectedList = adj[y]
        for connect in connectedList {
            indegreeList[connect] -= 1
            if indegreeList[connect] == 0 {
                stack.append(connect)
            }
        }
    }
    
    //if it is not possible to reverse the nodes then some node was mandatory before, creating cycle
    if result.count != numCourses {
        return false
    }
    return true
}

//---------------------------------------------------//

//same implementation:
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var adj = [[Int]](repeating: [Int](), count: numCourses)
    var indegreeList = [Int](repeating: 0, count: numCourses)
    
    //counting the indegrees
    for edge in prerequisites {
        let start = edge[1]
        let end = edge[0]
        adj[start].append(end)
        indegreeList[end] += 1
    }
    
    //create a temporary [Int] to reverse the nodes
    var stack = [Int]()
    for x in 0..<indegreeList.count {
        if indegreeList[x] == 0 {
            stack.append(x)
        }
    }
    
    //final [Int] to compare if it is possible to study all courses
    var result = [Int]()
    while stack.count > 0 {
        let y = stack.popLast()!
        result.append(y)
        let connectedList = adj[y]
        for connect in connectedList {
            indegreeList[connect] -= 1
            if indegreeList[connect] == 0 {
                stack.append(connect)
            }
        }
    }
    
    //if it is not possible to reverse the nodes then some node was mandatory before, creating cycle
    if result.count != numCourses {
        return [Int]()
    }
    return result
}

