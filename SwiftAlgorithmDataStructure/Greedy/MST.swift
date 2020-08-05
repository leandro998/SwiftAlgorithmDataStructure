//
//  MST.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 7/30/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// Minimum Spanning Tree Algorithms
public final class MST {
  
  /// Prim's MST Algorithm O(ElgV)
  /// Use Priority Queue (Binary Heap) and Adjacency List
  /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple
  /// - Returns: the minimum cost spanning tree
  public func primMST(_ graph: [[(v: Int, w: Int)]]) -> Int {
    //create variable to Queue the MSTGraph
    var q = IndexPriorityQueue<MSTGraph>(>)
    //create variable to store the minimum weighted path
    var min = 0
    
    //create the edges for each vertice
    var edges: Set<Int> = []
    for i in 0..<graph.count {
        for value in graph[i] {
            edges.insert(value.v)
        }
    }
    
    //create the adj list with the proper weight
    let numVertices = edges.max()!
    var adj = [[(v: Int,w: Int)]](repeating: [], count: numVertices + 1)
    for i in 0..<graph.count {
        //this will insert each "v" and "w" to the new adjList, creating the graph to be searched
        for value in graph[i]{
            adj[i].append(value)
            adj[value.v].append((i,value.w))
        }
    }
    
    //declaring new "array" to check if the node was visited or not
    var visited = [Bool](repeating: false, count: numVertices + 1)
    //enqueue the first value to start checking
    for value in graph[0]{
        q.enqueue(MSTGraph(source: 0, dest: value.v, weight: value.w))
    }
    
    visited[0] = true
    
    //create loop to count the minimum path between the nodes
    while !q.isEmpty {
        //after accessing the node we must dequeue it
        let node = q.dequeue()!
        if !visited[node.dest] {
            visited[node.dest] = true
            min += node.weight
            
            //enqueue the next vertice to check
            for value in adj[node.dest] {
                q.enqueue(MSTGraph(source: node.dest, dest: value.v, weight: value.w))
            }
        }
    }
    return min
  }
  
  /// Kruskal's MST Algorithm O(ElgE)
  /// Use Union-Find and Adjacency List (You can use Swift's built-in sort method.)
  /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple
  /// - Returns: the minimum cost spanning tree
  public func kruskalMST(_ graph: [[(v: Int, w: Int)]]) -> Int {
        return 0
    }
}
