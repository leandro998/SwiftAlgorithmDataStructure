//
//  BFS.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-14.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

func AdjacencyListAndBFS() {
  struct Pair {
    let first: Int
    let second: Int
  }
  let firstLine = readLine()!.split(separator: " ")
  // # of vertices
  let n = Int(firstLine[0])!
  // # of edges
  let m = Int(firstLine[1])!
  
  // adjacency list
  var adjList = [[Pair]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    let w = Int(edge[2])!
    adjList[u].append(Pair(first: v, second: w))
    adjList[v].append(Pair(first: u, second: w)) // undirected graph
  }
  
  // BFS - O(V + E)
  var visited = [Bool](repeating: false, count: n + 1)
  let queue = Queue<Int>()
  queue.enqueue(item: 1) // starting from vertex 1
  visited[1] = true
  
  while !queue.isEmpty() {
    let vertex = queue.dequeue()!
    print(vertex)
    for v in adjList[vertex] {
      if !visited[v.first] {
        queue.enqueue(item: v.first)
        visited[v.first] = true
      }
    }
  }
}
