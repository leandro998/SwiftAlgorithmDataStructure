//
//  DFS.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-13.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

func AdjacencyListAndDFS() {
    let firstLine = readLine()!.split(separator: " ")
    
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(firstLine[0])!
        let v = Int(firstLine[1])!
        adjList[u].append(v)
        adjList[v].append(u) //two ways edge (undirected graph)
    }
    
//    print(adjList) //this will print the array of all connections
    
    func dfs(start: Int, adjList: inout [[Int]], visited: inout [Bool]) {
        visited[start] = true
        print(start)
        for v in adjList[start] {
            if !visited[v] {
                dfs(start: v, adjList: &adjList, visited: &visited)
            }
        }
    }
    
    var visited = [Bool](repeating: false, count: n + 1)
    dfs(start: 1, adjList: &adjList, visited: &visited)
    
}
