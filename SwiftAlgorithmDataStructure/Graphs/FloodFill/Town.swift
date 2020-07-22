//
//  Town.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-22.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

func Town() {
  struct Square {
    let x: Int
    let y: Int
  }
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  /// 2D array to store the town map
  var townMap = [[Int]]()
  var groupMap = [[Int]](repeating: [Int](repeating: 0, count: 25), count: 25)
  var answer = [Int](repeating: 0, count: 25 * 25)
  
  func bfs(x: Int, y: Int, id: Int, n: Int) {
    let q = Queue<Square>()
    q.enqueue(item: Square(x: x, y: y))
    groupMap[x][y] = id
    answer[id] += 1
    
    while !q.isEmpty() {
      let square = q.dequeue()!
      let x = square.x
      let y = square.y
      for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        // check the bounds
        if nx >= 0 && nx < n && ny >= 0 && ny < n {
          if townMap[nx][ny] == 1 && groupMap[nx][ny] == 0 {
            q.enqueue(item: Square(x: nx, y: ny))
            groupMap[nx][ny] = id
            answer[id] += 1
          }
        }
      } //for end
    } //while end
  } //func bfs end
  
  let n = Int(readLine()!)!
  for _ in 0..<n {
    let row = readLine()!.map { Int(String($0))! }
    townMap.append(row)
  }
  
  var id = 0
  for x in 0..<n {
    for y in 0..<n {
      if townMap[x][y] == 1 && groupMap[x][y] == 0 {
        id += 1
        bfs(x: x, y: y, id: id, n: n)
      }
    }
  }
  print(id) // how many towns?
  answer = Array(answer[1...id])
  answer.sort()
  for i in 0..<id {
    print(answer[i])
  }
}
