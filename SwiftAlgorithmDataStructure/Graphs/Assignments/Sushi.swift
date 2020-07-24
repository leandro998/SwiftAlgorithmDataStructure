//
//  Sushi.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-24.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//  Done in class with Derrick Park
//

import Foundation

func Sushi() {
    final class Graph {
        let V: Int
        var E: Int
        var adj: [Set<Int>]
        
        init(V: Int) {
            self.V = V
            self.E = 0
            self.adj = [Set<Int>]()
            self.adj = [Set<Int>](repeating: Set<Int>(), count: V)

            /*faster code (replace line above):
            self.adj.reserveCapacity(V)
            for _ in 0..<V {
                self.adj.append(Set<Int>())
            } */

        }
        
        func addEdge(from u: Int, to v: Int) {
            E += 1
            adj[u].insert(v)
            adj[v].insert(u)
        }
        
        func degree(of v: Int) -> Int {
            return adj[v].count
        }
        
        func removeAllEdges(from v: Int) {
            E -= adj[v].count
            for u in adj[v] {
                adj[u].remove(v)
            }
            adj[v].removeAll()
        }
    } //end of class Graph
    
    struct DFS {
        var marked: [Bool]
        var depth: [Int]
        let s: Int
        
        init(G: Graph, s: Int) {
            self.s = s
            marked = [Bool](repeating: false, count: G.V)
            depth = [Int](repeating: 0, count: G.V)
            dfs(G, v: s, d: 0)
        }
        
        private mutating func dfs(_ G: Graph, v: Int, d: Int) {
            marked[v] = true
            depth[v] = d
            for u in G.adj[v] {
                if !marked[u] {
                    dfs(G, v: u, d: d + 1)
                }
            }
        }
    } //end struct DFS
    
    func removeLeaves(G: Graph, v: Int, sushi: Set<Int>, marked: inout [Bool]) {
        marked[v] = true
        for u in G.adj[v] {
            //if marked[u] is false removeLeaves
            if !marked[u] {
                removeLeaves(G: G, v: u, sushi: sushi, marked: &marked)
            }
        }
        //if degree == 1 the node is at the point, safe to remove. Only if sushi does not contain "status of sushi restaurant"
        if G.degree(of: v) == 1 && !sushi.contains(v) {
            G.removeAllEdges(from: v)
        }
    }
    
    //main function to call the others
    func calculateSushi() {
        let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
        let n = firstLine[0]
        
        let nextLine = readLine()!.split(separator: " ").map { Int($0)! }
        let realSushi = Set<Int>(nextLine)
        
        let graph = Graph(V: n)
        //this will take all the input on console and addEdge to the graph, line by line
        for _ in 0..<n-1 {
            let edge = readLine()!.split(separator: " ").map { Int($0)! }
            graph.addEdge(from: edge[0], to: edge[1])
        }
        
        let start = realSushi.first! //we must start searching where we consider a real restaurant
        //they all start not marked and will change to true when accessed in removeLeaves
        var marked = [Bool](repeating: false, count: graph.V)
        removeLeaves(G: graph, v: start, sushi: realSushi, marked: &marked)
        
        //diameter (dfs + 2)
        let dfs1 = DFS(G: graph, s: start)
        var maxNode = start
        for i in 0..<n {
            if dfs1.depth[i] > dfs1.depth[maxNode] {
                maxNode = i
            }
        }
        
        let dfs2 = DFS(G: graph, s: maxNode)
        var diameter = maxNode
        for i in 0..<n {
            if dfs2.depth[i] > dfs2.depth[diameter] {
                diameter = i
            }
        }
        
        //the result is calculating 2 times the number of Edges (2 ways) and subtracting the maximum diameter of the graph
        print("the result is: \(2 * (graph.E) - dfs2.depth[diameter])")
    }
    
    //recursive call-back
    calculateSushi()
    
} //end main func Sushi()
