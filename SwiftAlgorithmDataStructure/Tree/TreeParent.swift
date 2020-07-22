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

//----------Derrick's solution -----------------

func WhosMyParent() {
  let n = Int(readLine()!)!
  var adj = [[Int]](repeating: [], count: n + 1)
  var check = [Bool](repeating: false, count: n + 1)
  var parent = [Int](repeating: 0, count: n + 1)
  
  for _ in 0..<n-1 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v)
    adj[v].append(u)
  }
  
  check[1] = true
  let q = Queue<Int>()
  q.enqueue(item: 1)
  while !q.isEmpty() {
    let u = q.dequeue()!
    for v in adj[u] {
      if !check[v] {
        check[v] = true
        parent[v] = u
        q.enqueue(item: v)
      }
    }
  }
  
  for i in 2...n {
    print(parent[i])
  }
}

func Diameter() {
  struct Edge {
    let to: Int
    let distance: Int
  }
  
  func bfs(node: Int, check: inout [Bool], distances: inout [Int], adj: inout [[Edge]]) {
    let q = Queue<Int>()
    check[node] = true
    q.enqueue(item: node)
    while !q.isEmpty() {
      let x = q.dequeue()!
      for i in 0..<adj[x].count {
        let edge = adj[x][i]
        if !check[edge.to] {
          distances[edge.to] = distances[x] + edge.distance
          q.enqueue(item: edge.to)
          check[edge.to] = true
        }
      }
    }
  }
  
  func calcDiameter() {
    let n = Int(readLine()!)!
    var adj = [[Edge]](repeating: [], count: n + 1)
    var check = [Bool](repeating: false, count: n + 1)
    var distances = [Int](repeating: 0, count: n + 1)
    
    for _ in 1...n {
      let line = readLine()!.split(separator: " ").map { Int($0)! }
      let from = line[0]
      var j = 1
      while j < line.count - 2 {
        let to = line[j]
        let dist = line[j + 1]
        adj[from].append(Edge(to: to, distance: dist))
        if line[j + 2] == -1 {
          break
        }
        j += 2
      }
    }
    var start = 1
    bfs(node: start, check: &check, distances: &distances, adj: &adj)
    /// check the furthest node from 1 (start)
    for i in 2...n {
      if distances[i] > distances[start] {
        start = i
      }
    }
    
    /// Find the furtest node from the node we got from the previous step
    var check2 = [Bool](repeating: false, count: n + 1)
    var distances2 = [Int](repeating: 0, count: n + 1)
    bfs(node: start, check: &check2, distances: &distances2, adj: &adj)
    print(distances2.max()!)
  }
  
  calcDiameter()
}

