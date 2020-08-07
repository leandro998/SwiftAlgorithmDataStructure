//
//  DijkstraPQ.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Derrick Park on 8/4/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func DijkstraIPQ() {
  
  /// All vertices starting from 1 to n
  func dijkstra(_ adj: inout [[Edge]], _ src: Int) -> [Int] {
    let n = adj.count
    var dist = [Int](repeating: Int.max, count: n)
    dist[src] = 0
    var pq = IndexPriorityQueue<Edge>(<)
    for edge in adj[src] {
      pq.enqueue(Edge(v: edge.v, w: edge.w))
    }
    
    while let edge = pq.dequeue() {
      if dist[edge.v] > edge.w {
        dist[edge.v] = edge.w
        for e in adj[edge.v] {
          pq.enqueue(Edge(v: e.v, w: e.w + edge.w))
        }
      }
    }
    return dist
  }
}
